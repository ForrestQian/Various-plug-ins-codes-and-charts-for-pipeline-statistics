import pandas as pd
import numpy as np
index = np.array(pd.read_excel('街区面积与管段汇水面积计算表.xlsx', sheet_name='排水管计算-02'))
Area = np.array(pd.read_excel('街区面积与管段汇水面积计算表.xlsx', sheet_name='面积汇总'))

data = np.array(index[:, 5:7])
all_area = []
count = 0
# 输出模块
for i in range(data.shape[0]):
    set_index = str(data[i, 0]).split('、')
    area = 0
    if set_index[0].replace(' ', '') == '街区总面积':
        area = count
        count = 0
        data[i, 1] = area
        continue
    if set_index[0].replace(' ', '') == '汇水街区':
        area = '街区面积/ha'
        data[i, 1] = area
        continue
    for j in set_index:
        if j.isdigit():
            area_index = int(j)
            all_area.append(area_index)
            area += Area[area_index-1, 1]
    count += area
    data[i, 1] = area
OUT = pd.DataFrame(data).to_excel('输出统计汇水面积.xlsx')
# 检查用
# print(Area)
# all_area.sort()
# error_1 = [y for y in Area[:, 0] if y not in all_area]
# error_2 = [y for y in all_area if y not in Area[:, 0]]
# error_3 = [y for y in all_area if all_area.count(y) > 1]
# print('漏统计面积：', error_1)
# print('多统计面积：', error_2)
# print('重复统计面积：', error_3)