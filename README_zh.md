多轮对话改写

## 环境

python-3.7.11

overrides==2.8.0
allennlp==0.9.0
simplediff==1.0
numpy==1.18.1
torch==1.10.2
rouge==0.3.2
nltk==3.4.5
tqdm==4.42.1
jieba
spacy==2.1.9

## 调用

调用的函数接口文件路径:当前目录/src/rewrite.py

当输入为中文时，需调用rewrite_function_cn函数：

  输入形式：字与字之间间隔1个空格，句与句之间间隔2个制表符"\t"，无标点符号。
  形如，"你 最 喜 欢 看 哪 个 电 影      行 尸 走 肉     你 咋 这 么 重 口 味 呢     咋 滴 我 喜 欢      你 最 喜 欢 它 里 面 哪 个 演 员"

  输出形式:只输出改写的句子，字与字之间无间隔。
  形如，"你最喜欢行尸走肉它里面哪个演员"


当输入为英文时，需调用rewrite_function_en函数：

  输入形式：单词(标点符号)与单词(标点符号)之间间隔1个空格，句与句之间间隔2个制表符"\t"
  形如:gary oldman		mainstream success ( 1991 - 2001 )		what garnered his success ?

  输出形式:只输出改写的句子，句子形式与输入形式相同
  形如:what garnered gary oldman 's success ?

### 数据集样例

中文数据集样例为rewrite.txt,英文数据集样例为CANARD.txt

### 模型文件

模型文件均放在pretrained_weights文件夹

rewrite_bert.tar.gz：https://github.com/microsoft/ContextualSP/releases/download/rewrite.bert/rewrite_bert.tar.gz

canard.tar.gz：https://github.com/microsoft/ContextualSP/releases/download/canard/canard.tar.gz

multi_bert.tar.gz：https://github.com/microsoft/ContextualSP/releases/download/multi.bert/multi_bert.tar.gz
