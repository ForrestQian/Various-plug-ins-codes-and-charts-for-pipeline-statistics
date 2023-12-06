import pandas as pd

with open("统计线长.txt", "r", encoding='utf-8') as f:
    array = []
    for ann in f.readlines():
        ann = ann.strip('\n')  # 去除文本中的换行符
        if ann[0:3] == '总长度':
            array.append(float(ann[4:]) * 10)
    OUT = pd.DataFrame(array)
    OUT.to_excel('统计线长.xlsx')