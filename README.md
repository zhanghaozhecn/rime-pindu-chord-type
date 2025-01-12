**拼读并击说明书**

**QQ：576440085**

**交流群：374971723**

# 输入法下载安装
1. [下载RIME小狼毫输入法](https://rime.im)
1. 运行安装包，连续点击确定，直至重启。
1. 右击右下角的小狼毫图标，点击用户文件夹。
1. 打开方案文件包，把yaml、lua文件和lua文件夹复制到打开的用户文件夹。
1. 右击小狼毫图标，点击重新部署，等待至右下角跳出的部署图标消失，即可开始打字。

# 简介
拼读并击是一种音形并击输入方案，通过将带调拼音拆分成声介和韵调，实现简单、高效的目标。无序元素量只有95个，易于五笔；一击能打出1280种音节，词语动态选重率仅为2.17%，优于五笔，与高级形码不相上下。

**各种方案性能比较**
|                   | 小鹤双拼   | 拼读并击 | 五笔86 | 虎码  | 蓝宝石新 |
|-------------------|------------|----------|--------|-------|----------|
| 无序元素量        | 29       | 95    | 200   | 241   | 400      |
| 记忆量[1]         | 30         | 111      | 140    | 341  | 559     |
| 前两码信息量[2]     | 410        | 1280     | 625    | 676   | 625      |
| 6万词语动态选重率 | 11.06%[3] | 2.17%    | 7.31%  | 2.78% | 2.00%    |

[1]记忆量为lg(把若干个不同的元素放到若干个不同的键位上且键位不空的方法数)。只考虑前两码。

[2]对于音码，取音节数；对于形码，取码元数^2

[3]按四码定长构词规则

# 字音元素
## 提取声介、韵调
汉语音节可以由声介和韵调拼读而成，这也是本方案名称的由来。
通过以下方法将音节拆成声介和韵调：
1. 将声调写成数字形式，轻声和一声合并，如拼读→pin1 du2，的→de5→de1。
1. 将开头为y/w的拼音改回零声母形式：yi/y→i，wu/w→u，yu→ü。
1. 将jqx后的u改回ü：ju→jü，qu→qü，xu→xü。
1. 修改韵母：ui→uei，iu→iou，ong→ueng，iong→üeng。
1. 将变形后的拼音从声母（如果有）和iuü（如果有）后的位置切开。前面一半称为声介，后面一半称为韵调。若声介为空，用#表示，如ai4→#+ai4。若韵调只有声调，用#1~#4表示，如du2→du+#2。
1. 声介bu、pu、mu、fu、zhi、chi、shi、ri、zi、ci、si分别归并到b、p、m、f、zh、ch、sh、r、z、c、s；韵er、o、n、ng分别归并到#、e、en、eng。归并后一共获得51种声介和44种韵调。

**音节变形**
| 拼音 | 本方案 | 拼音 | 本方案 | 拼音 | 本方案 | 拼音  | 本方案 |
|------|--------|------|--------|------|--------|-------|--------|
| ju*  | jü*    | yi   | i      | wu   | u      | yu    | ü      |
| qu*  | qü*    | ya   | ia     | wa   | ua     |       |        |
| xu*  | xü*    | ye   | ie     | wo   | uo     | yue   | üe     |
| *iu  | *iou   | yao  | iao    | wai  | uai    |       |        |
| *ui  | *uei   | you  | iou    | wei  | uei    |       |        |
|      |        | yan  | ian    | wan  | uan    | yuan  | üan    |
|      |        | yin  | in     | wen  | un     | yun   | ün     |
|      |        | yang | iang   | wang | uang   |       |        |
|      |        | ying | ing    | weng | ueng   | yong  | üeng   |
|      |        | yo   | io     | *ong | *ueng   | *iong | *üeng   |

**音节拆分样例**
|                |                |               |
|----------------|----------------|---------------|
| sheng3→sh+eng3 | yi2→i+#2       | wu3→u+#3      |
| ge1→g+e1       | yo5→i+e1       | yu4→ü+#4      |
| me5→m+e1       | o5→#+e1        | zhui1→zhu+ei1 |
| er4→#+#4       | shi4→sh+#4     | hun4→hu+en4   |
| dong1→du+eng1  | xiong1→xü+eng1 | qu1→qü+#1     |
| jiu4→ji+ou4    | beng2→b+eng2   | yun2→ü+en2    |

## 键位映射
声介用左手打出，韵调用右手打出。声介、调韵的键位映射见下表。

**声介、韵调键位映射**
| 声介 	| 键位 	| 声介 	| 键位 	| 声介 	| 键位 	| 声介 	| 键位 	| 韵调 	| 键位 	| 韵调 	| 键位 	| 韵调 	| 键位 	|
|:----:	|:----:	|:----:	|:----:	|:----:	|:----:	|:----:	|:----:	|:----:	|:----:	|:----:	|:----:	|:----:	|:----:	|
|   d  	|   F  	|  qi  	|  DF  	|  zu  	|  EF  	|  ku  	|  CG  	|  #4  	|   J  	| eng4 	|  JK  	| ang2 	|  JI  	|
|   i  	|   D  	|   ü  	|  SD  	|  ti  	|  WF  	|  pi  	|  XG  	|  e1  	|   K  	|  ao4 	|  KL  	| ang3 	|  JO  	|
|  sh  	|   S  	|   g  	|  SF  	|  mi  	|  QF  	|  cu  	|  ZG  	|  #3  	|   L  	|  en2 	|  JL  	|  en3 	|  JP  	|
|  ji  	|   A  	|   t  	|  AF  	|  chu 	|  DV  	|  lü  	|  AS  	|  #1  	|   ;  	|  ai4 	|  J;  	|  a3  	|  MK  	|
|  zh  	|   G  	|  hu  	|  ER  	|  qü  	|  SV  	|  nu  	|  SE  	|  e4  	|   H  	|  an1 	|  UI  	|  ou2 	|  ML  	|
|  xi  	|   R  	|  zhu 	|  WE  	|   s  	|  AV  	|  nü  	|  XD  	|  #2  	|   U  	|  a4  	|  IO  	|  ei2 	|  M;  	|
|   u  	|   E  	|   r  	|  WR  	|  ni  	|  CF  	|      	|      	| eng1 	|   I  	| ang4 	|  UO  	|  ei3 	|  J,  	|
|   b  	|   W  	|  ch  	|  QR  	|   c  	|  XF  	|      	|      	|  an4 	|   O  	|  ou3 	|  UP  	|  ao1 	|  J.  	|
|   z  	|   Q  	|  du  	|  CV  	|  tu  	|  ZF  	|      	|      	|  e2  	|   P  	|  an3 	|  M,  	|  ou1 	|  J/  	|
|   f  	|   T  	|  di  	|  XC  	|  xü  	|  DR  	|      	|      	| eng2 	|   Y  	| ang1 	|  ,.  	|  ei1 	|  UK  	|
|  gu  	|   V  	|   k  	|  XV  	|  jü  	|  SR  	|      	|      	|  e3  	|   M  	|  ou4 	|  M.  	|  a2  	|  UL  	|
|   m  	|   C  	|   '  	|  ZV  	|  su  	|  AR  	|      	|      	|  en1 	|   ,  	|  ao3 	|  M/  	|  ao2 	|  U;  	|
|  li  	|   X  	|   n  	|  DG  	|   p  	|  EG  	|      	|      	|  ei4 	|   .  	|  en4 	|  HK  	|  ai3 	|  HI  	|
|   h  	|   Z  	|  bi  	|  SG  	|  lu  	|  WG  	|      	|      	|  an2 	|   /  	|  ai2 	|  HL  	|  ai1 	|  HO  	|
|   l  	|   B  	|  shu 	|  AG  	|  ru  	|  QG  	|      	|      	|  a1  	|   N  	| eng3 	|  H;  	|      	|      	|

# 字的打法
本方案收录通用规范汉字8105个和其他汉字28个，共8133个，含多音字为9247个。字的打法有3种，从常见到不常见分别称为一级字、二级字、三级字。字的位置是固定的。

## 一级字
一级字为51种声介对应的最常用的51个字，打法为左手声介，且只能用一级字打法打出，包括：的了在是和一这他我不就地中说人个对你而与从两去那所小或看三如其过并最才出们成同条法快学句名路跑女批率弄

例如：的→de5→d→F，弄→nong4→nu→SE

## 二级字
剩余的字可以用二级字打法打出。打法为左手声介+右手韵调，以下称为音节。然后可以进行选重，空格为首选，JK为二选，KL为三选，JL为四选，J;为五选；也可以用音节+空格直接打出首选。[或HK为上页，]或HL为下页。

以下65个字只能用二级字打法，不能用三级字打法：要还得会新则吧做吗事真性没吃呀另既住副量近重区谈据派共随九西接喝颗班金幅值需股城任抱钟烟错皮必菜丝穷拖然哦木零汉茶安齐愿肥运捉哎哟

例如：要→yao4→i+ao4→DKL'\_或DKL_，式→shi4→sh+#4→SJ'JK，其中'表示击与击的间隔，_表示空格

## 三级字
若要快速打出非二级字首选，可以补充部首，取码规则见字形元素一章。此部分为进阶，请熟悉其他部分后再阅读。

三级字打法为：第1击音节；第2击部首。第2击同时按空格可以直接打出三级字次选。

例如：记→ji4+讠→AJ'O，计→ji4+讠→AJ'O'JK或AJ'O_，剂→ji4+刂→AJ'F

# 词的打法
本方案使用大词库，另外RIME可以自动调节词语位置，并根据历史上屏字词生成新词语，最多7字。建议用户按照自然分词习惯打词，不要管词库范围。

## 二字词
第1击：首字的音节。

第2击：次字的音节。

## 三字以上词
第1击：首字的音节。

第2击：次字的音节+空格。

第3击：末字的音节。

## 简词
简词只需一击，有51个，由首字的左手声介+空格打出，包括：我们一个他们没有发展可以自己就是什么这个工作起来不是主要作用人们但是现在需要所以如果必须出来活动条件通过思想而且具有对于还是成为各种存在地方于是历史你们那么来说才能全国水平明显农业控制朋友平均女人落后绿色

例如：我们→我→wo3→u→E_

# 其他
符号、选重、翻页由右手单手打出，见下表。

| 键位 | 符号 | 键位 |  符号 |
|:----:|:----:|:----:|:-----:|
|   J  |  ，  |  JK  |  二选 |
|   K  |  。  |  KL  |  三选 |
|   L  |  ？  |  JL  |  四选 |
|   ;  | ;¥€£ |  J;  |  五选 |
|   H  |  、  |  UI  |   （  |
|   U  |   “  |  IO  |   ）  |
|   I  |   ”  |  UO  |   《  |
|   O  |  ：  |  UP  |   》  |
|   P  |  ；  |  M,  |   ·   |
|   Y  |  ——  |  ,.  |   ～  |
|   M  |  ！  |  M.  | ‘〈【 |
|   ,  | ,°℃℉ |  M/  | ’〉】 |
|   .  |   .  |  HK  |  上页 |
|   /  |   /  |  HL  |  下页 |
|   N  |  ……  |      |       |

其他键位功能如下：
* 1234567890：仅用于数字，可以直接顶字词上屏，不能选重。
* []：上页、下页。
* 退格：有编码时清除所有编码。
* SHIFT：切换中英文。
* CRTL+空格：开关输入法。

# 字形元素
形码部分使用本人发明的“形旁部首码”，只取一个部首。

## 提取部首
形旁部首码是一种只取一码的音码辅助码，设计的目的是使两音一形的选重率最低，主要手段是优先使用形旁，剔除形码中和音码重复的信息（即声旁）。码表提供的是字到部首的映射，用户可以把部首再映射到拼音、二笔、无理码等元素上，形成自己的辅助码。本方案中部首被映射到声介和15个无理码上。

部首有182个：一二三耒王玉示韦十工士土扌髟走赤老艹耳革木寸鬲豆覀雨酉支厂廾不石页大犬尢豕龙歹匚车牙戈瓦丨非止齿虍刂业小卜⺌冂囗口日目田足虫邑巾山罒皿水贝肉见黑骨丿钅手牛缶矢毛气舌竹禾香攵亻片臼鼠隹白鼻身鬼阜血斤彳行爪彡舟瓜八人金父谷豸食儿匕勹几⺈月用鱼犭风欠角夕夊鸟饣殳丶冫亠言广文疒鹿衣立辛音方门丷羊米首火氵斗忄灬宀穴冖讠户衤礻辶心乛彐聿尸己弓凵卩子刀力女皮廴厶又羽矛马纟母糸。

其中韦=韋、老=耂、艹=艸、木=朩、覀=西、厂=𠂆、页=頁、尢=兀、龙=龍、歹=歺、车=車、齿=齒、虍=虎、卜=⺊、⺌=𭕄、日=曰、邑=阝右、罒=四、贝=貝、水=氺、见=見、钅=釒、牛=牜、手=龵、竹=、攵=攴、阜=阝左、爪=爫、人=入、鱼=魚、风=風、鸟=鳥、饣=飠、门=鬥門、羊=𦍌、户=戶、心=㣺、乛=乙、彐=彑、聿=肀、己=已巳、卩=㔾、子=孑、纟=糹、马=馬、母=毌毋。

以下是取部首的规则。

### 部首字
字本身为部首时，取首笔画。例：**父→丿**。

### 形声字
特指明显的形声字，即声旁与字的读音相似（清晴青，努弩奴），或者声旁相同的两个以上字的读音相似（稳隐相似但和急不相似，活括话相似但和舌不相似），相似指部分相似，如声母分别为j和zh也认为相似，只有完全看不出的形声字才会排除。

形声字去掉声旁部分，检察形旁情况。

如果**形旁是部首**，取形旁作为部首。例：**势→力**，**堂→土**。

如果**形旁不是部首**，将形旁二分。
1. 左右结构的字，按照从上到下的顺序找部首。例：**将→夕**（声旁在左，取右上“夕”，不取右下“寸”），**懿→心**（声旁在左，右上“次”非部首，取右下“心”）。
1. 上下结构的字，按照从左到右的顺序找部首。例：**毙→歹**（声旁在上，取左下“歹”，不取右下“匕”）。
1. 半包围结构的字，取离声旁更近的部首。例：**截→戈**（声旁在左下，取“戈”，不取“土”），**雁→亻**（声旁在左上，取“亻”，不取“隹”）。

### 非形声字
特指除部首字和明显的形声字之外的字，即会意字、指事字、象形字和声旁字形变化、声旁和字的读音不像、声旁不会读的形声字。对非形声字进行分区，两分优先。对任何字都**优先取多笔部首**，没有多笔部首时才取单笔部首，规则按照有一个部分。

#### 有一个部分
按照**散>连>交，笔画顺序**的优先级取部首。例：**书→丶**（没有多笔部首，找单笔部首，取散的“丶”，不取交的首笔“乛”），**事→口**（先找多笔部首，没有散、连的部首，找交的部首，取先出现的“口”，不取后出现的“彐”）。

#### 有两个部分
规定先出现的为部分A，后出现的为部分B。

如果**B是辶廴走凵**，取B。例：**凼→凵**，**连→辶**。

如果**A是部首**，取A。例：**顷→匕**。

如果**A不是部首，B是部首**，取B。例：**贵→贝**。

如果**A和B都不是部首**，对A和B分别进行二分。
1. 左右结构的字，只在靠左和右边界的部件里找部首，顺序为左上、左下、右上、右下。例：**蠲→皿**（左上不是部首，左下是部首）。
1. 上下结构的字，只在靠上和下边界的部件里找部首，顺序为左上、右上、左下、右下。例：**蠢→虫**（日在中间直接排除，上不是部首，左下是部首），**巢→木**（上半二分后无多笔部首，下半“果”二分后取靠下的“木”）。

若四个部分都不是多笔部首，转有一个部分。例：**临→囗**（四个部分都不是多笔部首，转有一个部分，取唯一的多笔部首“囗”）。

#### 有三个部分
二分边界有争议的字也属于此类。
1. 左中右结构的字，将靠左的部件视为部分A，靠右的部件视为部分B。例：**嬲→男男**，**掰→手手**。
1. 上中下结构的字，将靠上的部件视为部分A，靠下的部件视为部分B。例：**彝→彐艹**，**真→十八**，**克→十儿**。

然后参考**有两个部分**处理。
例：**嬲→田**，**掰→手**，**彝→彐**，**真→十**，**克→十**。

## 键位映射
大部分部首用其读音的声介表示，部首读音的声介见**表-左手声介部首**。

为了减少重码，把15个部首放在右手单键上，其位置见**表-右手无理部首**。记忆技巧：上排页扌亻讠忄与人体相关，其中“页”义为人脸；中排钅木氵石山是自然元素，前三个属五行；下排邑纟衤鱼饣与衣食住行相关，其中纟衤是衣，鱼饣是食，“邑”义为城市，跟住有关。右手的部首不包括字源相同的变体，如**忄**在右手键位P上，而**心**在左手声介xi上。

**左手声介部首**
| 声介 | 部首               | 声介 | 部首                       |
|------|--------------------|------|----------------------------|
| #    | 儿而耳二           | gu   | 弓工骨谷瓜广鬼             |
| i    | 牙言羊业衣音尢酉又 | k    | 口                         |
| u    | 瓦王韦文           | ku   | 囗匚冂凵                   |
| v    | 用羽雨玉聿月       | h    | 禾黑一                     |
| b    | 丷八白勹贝卜不     | hu   | 虍户火灬                   |
| bi   | 鼻匕髟冫疒         | ji   | 几己见角卩巾金斤臼         |
| p    | 攵夊               | qi   | 气欠                       |
| pi   | 皮片丿             | qv   | 犭犬                       |
| m    | 马毛矛门母目       | xi   | 夕覀香小⺌心辛行           |
| mi   | 米冖皿             | xv   | 穴彐血                     |
| f    | 方非风缶阜父       | zh   | 乛支止豸舟                 |
| d    | 大歹刂⺈刀斗豆     | zhu  | 竹爪隹                     |
| di   | 丶                 | ch   | 厂车齿彳赤                 |
| t    | 亠                 | chu  | 虫巛                       |
| ti   | 田                 | sh   | 彡舌身尸十食矢豕礻士示手首 |
| tu   | 土                 | shu  | 殳鼠丨水                   |
| ni   | 鸟牛               | r    | 人日肉                     |
| nv   | 女                 | z    | 子辶走廴                   |
| l    | 老耒               | zu   | 足                         |
| li   | 力立               | c    | 艹廾                       |
| lu   | 龙鹿               | cu   | 寸                         |
| g    | 宀戈革鬲艮         | s    | 三糸厶罒                   |

**右手无理部首**
|  6 |  7 |  8 |  9 |  0 |
|:--:|:--:|:--:|:--:|:--:|
| 页 | 扌 | 亻 | 讠 | 忄 |
| 钅 | 木 | 氵 | 石 | 山 |
| 邑 | 纟 | 衤 | 鱼 | 饣 |

# 练习方法
整体练习顺序为一级字→二级字→二字词→简词→高频字。具体为先练习一级字熟悉声介，再练习二级字熟悉韵调，此时方案已经入门了，可以练习词语和简单的文章，最后再练习高频字来熟悉部首。
建议使用**极速跟打器**练习本方案。
1. [下载极速跟打器](https://www.jsxiaoshi.com)
1. 解压安装包后，打开跟打器目录，将“拼读并击入门词提.txt”放到“编码文件”文件夹中，将几个练习文本放到“文章”中。
1. 打开跟打器，菜单→设置→编码文件，选择“拼读并击入门词提”，打开编码提示（提示当前字音节的实际按键）、词组标记（提示简词）。
1. 菜单→发文，选择要练习的本地文本，一般字数设置成10字，条件设置成键准100%，次数5次，字可以乱序，词语只能重打，“独练”和“开启”两个选框勾上，然后分段练习。
