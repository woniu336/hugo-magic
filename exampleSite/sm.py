import json
import os

# 定义JSON文件路径
json_file = "data/summary/summary.json"

# 提示输入slug和summary
slug = input("输入 slug: ")
summary = input("输入 summary: ")

# 创建新的JSON对象
new_entry = {
    "title": "",
    "slug": slug,
    "generated": True,
    "summary": summary
}

# 检查文件是否存在，不存在则创建
if not os.path.exists(json_file):
    os.makedirs(os.path.dirname(json_file), exist_ok=True)
    initial_content = {"summaries": []}
    with open(json_file, 'w', encoding='utf-8') as f:
        json.dump(initial_content, f, ensure_ascii=False, indent=4)

# 读取现有的JSON内容
with open(json_file, 'r', encoding='utf-8') as f:
    data = json.load(f)

# 添加新的条目到summaries数组中
data["summaries"].append(new_entry)

# 保存更新后的JSON内容
with open(json_file, 'w', encoding='utf-8') as f:
    json.dump(data, f, ensure_ascii=False, indent=4)

print("摘要添加成功.")
