import pandas as pd
with open("高程统计.txt", "r", encoding='utf-8') as f:
    array = []
    for ann in f.readlines():
        ann = ann.strip('\n').replace(' ', '')  # 去除文本中的换行符
        if 'Z=' in ann:
            place = ann.find('Z=')
            print(place)
            array.append(float(ann[place+2:]))
    OUT = pd.DataFrame(array)
    OUT.to_excel('高程统计.xlsx')