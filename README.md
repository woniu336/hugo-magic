## 快速建站

在桌面右键打开 Git bash 运行以下命令

```bash
hugo new site quickstart
cd quickstart
git init
git submodule add https://github.com/woniu336/hugo-magic.git themes/hugo-magic
```

## 拷贝文件

拷贝 hugo-magic 主题核心文件到根目录 quickstart

```bash
cp -rf themes/hugo-magic/exampleSite/* .
rm hugo.toml
mkdir -p data/summary 
mkdir -p assets/img 
cp themes/hugo-magic/data/footer_links.json data/ 
cp themes/hugo-magic/data/summary/summary.json data/summary/
cp -r themes/hugo-magic/archetypes .
cp -r themes/hugo-magic/shell .
cp -r themes/hugo-magic/static .
cp themes/hugo-magic/.gitignore .
```

