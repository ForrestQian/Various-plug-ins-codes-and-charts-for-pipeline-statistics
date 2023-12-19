import pandas as pd
import numpy as np

Value = pd.read_excel('经济估算指标表.xlsx')
Data = pd.read_excel('排水水力计算表.xlsx',sheet_name='方案1')
Value = np.delete(np.array(Value), np.s_[23:26], axis=0)
Data = np.delete(np.array(Data),np.s_[0:11],axis=0)
Data = np.delete(Data, np.s_[20:], axis=1)

data_0 = np.array([['0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]])
data = np.array([['管段编号', '管道长度', '管径', '坡度', '起端埋深', '末端埋深', '施工方式', '开挖费用', '回填费用', '材料费用', '顶管顶进费用', '总费用']])
empty = np.array([[np.nan, np.nan, np.nan, np.nan, np.nan, np.nan, np.nan, np.nan, np.nan, np.nan, np.nan, np.nan]])

line_set = 6.0
# 转化字符串为数字用
def is_number(s):
    if np.isnan(s):
        pass
    else:
        try:
            float(s)
            return True
        except ValueError:
            pass

        try:
            import unicodedata
            unicodedata.numeric(s)
            return True
        except (TypeError, ValueError):
            pass

    return False

def number(s):
    try:
        float(s)
        return float(s)
    except ValueError:
        pass

    try:
        import unicodedata
        unicodedata.numeric(s)
        return unicodedata.numeric(s)
    except (TypeError, ValueError):
        pass

    return s

for j in Data:
    if is_number(j[1]) and is_number(j[3]) and is_number(j[4]) and is_number(j[18]) and is_number(j[19]):
        L = float(j[1])           ## 管长
        D = j[3]                  ## 管径
        I = float(j[4])           ## 坡度
        h_1 = float(j[18])        ## 起端埋深
        h_2 = float(j[19])        ## 末端埋深
        data_0[0][0] = j[0]
        data_0[0][1] = L
        data_0[0][2] = D
        data_0[0][3] = I
        data_0[0][4] = h_1
        data_0[0][5] = h_2
        if j[0].find('已计入') > -1:
            data_0[0][6] = np.nan    ## 施工方式
            data_0[0][7] = np.nan    ## 开挖费用
            data_0[0][8] = np.nan    ## 回填费用
            data_0[0][9] = np.nan    ## 材料费用
            data_0[0][10] = np.nan   ## 顶管顶进费用
            data_0[0][11] = np.nan   ## 总费用
            np.append(data, data_0, axis=0)
            continue
        elif (j[0].find('穿铁路管') > -1 or h_1 >= line_set or h_2 >= line_set):
            data_0[0][6] = '顶管施工'
        elif j[0].find('穿河管') > -1:
            data_0[0][6] = '双管+顶管施工'
        else:
            data_0[0][6] = '开槽埋管施工'
        ## 获取对应管径指标
        index = 0
        for k in range(Value.shape[0]):
            if Value[k][0] == D:
                index = k
                break
            else:
                continue
        distance = np.sqrt(L ** 2 - (I * L) ** 2)      ## 垂直距离
        B = Value[k][2]                                ## 沟槽宽度
        V_dig_0 = (distance * (h_1 + h_2) * B) / 2     ## 开槽施工开挖量
        V_back_0 = V_dig_0 - np.pi / 4 * ((D / 1000) ** 2) * L
                                                       ## 开槽施工回填量
        length = Value[k][6]
        wide = Value[k][5]
        V_dig_1 = length * wide * (h_1 + h_2)          ## 顶管施工开挖量
        V_back_1 = V_dig_1                             ## 顶管施工回填量
        pipe_value = Value[k][1]                    ## 管材单价
        dig_value = Value[k][7]                     ## 开挖单价
        back_value = Value[k][8]                    ## 回填单价
        push_value = Value[k][9]                    ## 顶进施工单价
        if data_0[0][6] == '开槽埋管施工':
            data_0[0][7] = float(V_dig_0 * dig_value)
            data_0[0][8] = float(V_back_0 * back_value)
            data_0[0][9] = float(L * pipe_value)
            data_0[0][10] = float(0)
        elif data_0[0][6] == '顶管施工':
            data_0[0][7] = float(V_dig_1 * dig_value)
            data_0[0][8] = float(V_back_1 * back_value)
            data_0[0][9] = float(L * pipe_value)
            data_0[0][10] = float(L * push_value)
        elif data_0[0][6] == '双管+顶管施工':
            data_0[0][7] = float(V_dig_1 * dig_value * 2)
            data_0[0][8] = float(V_back_1 * back_value * 2)
            data_0[0][9] = float(L * pipe_value * 2)
            data_0[0][10] = float(L * push_value * 2)
        data_0[0][11] = float(data_0[0][7]) + float(data_0[0][8]) + float(data_0[0][9]) + float(data_0[0][10])
        data = np.append(data, data_0, axis=0)
        data_0 = np.array([['0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]])
    else:
        data = np.append(data, empty, axis=0)

OUT = pd.DataFrame(data)
OUT = OUT.applymap(number)
OUT.to_excel('经济估算总表-01.xlsx')