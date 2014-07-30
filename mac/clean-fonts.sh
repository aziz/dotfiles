#!/bin/bash

echo "==> cleaning 100+ System fonts that are never used"
list=$(cat <<EOF
Apple LiGothic Medium.ttf
Apple LiSung Light.ttf
AppleGothic.ttf
AppleMyungjo.ttf
AppleSDGothicNeo-ExtraBold.otf
AppleSDGothicNeo-Heavy.otf
AppleSDGothicNeo-Light.otf
AppleSDGothicNeo-Medium.otf
AppleSDGothicNeo-SemiBold.otf
AppleSDGothicNeo-Thin.otf
AppleSDGothicNeo-UltraLight.otf
Bangla MN.ttc
Bangla Sangam MN.ttc
Baoli.ttc
BiauKai.ttf
Devanagari Sangam MN.ttc
DevanagariMT.ttf
DevanagariMTBold.ttf
Gujarati Sangam MN.ttc
GujaratiMT.ttf
GujaratiMTBold.ttf
Gungseouche.ttf
Gurmukhi MN.ttc
Gurmukhi Sangam MN.ttc
Gurmukhi.ttf
Hannotate.ttc
Hanzipen.ttc
Hiragino Sans GB W3.otf
Hiragino Sans GB W6.otf
Kailasa.ttf
Kaiti.ttc
Kannada MN.ttc
Kannada Sangam MN.ttc
Khmer MN.ttc
Khmer Sangam MN.ttf
Kokonor.ttf
KozGoPr6N-Bold.otf
KozGoPr6N-ExtraLight.otf
KozGoPr6N-Heavy.otf
KozGoPr6N-Light.otf
KozGoPr6N-Medium.otf
KozGoPr6N-Regular.otf
KozGoPro-Bold.otf
KozGoPro-ExtraLight.otf
KozGoPro-Heavy.otf
KozGoPro-Light.otf
KozGoPro-Medium.otf
KozGoPro-Regular.otf
KozMinPr6N-Bold.otf
KozMinPr6N-ExtraLight.otf
KozMinPr6N-Heavy.otf
KozMinPr6N-Light.otf
KozMinPr6N-Medium.otf
KozMinPr6N-Regular.otf
KozMinPro-Bold.otf
KozMinPro-ExtraLight.otf
KozMinPro-Heavy.otf
KozMinPro-Light.otf
KozMinPro-Medium.otf
KozMinPro-Regular.otf
Lantinghei.ttc
Lao MN.ttc
Lao Sangam MN.ttf
Libian.ttc
Malayalam MN.ttc
Malayalam Sangam MN.ttc
MshtakanBold.ttf
MshtakanBoldOblique.ttf
MshtakanOblique.ttf
MshtakanRegular.ttf
Myanmar MN.ttc
Myanmar Sangam MN.ttf
NanumGothic.ttc
NanumMyeongjo.ttc
NanumScript.ttc
NISC18030.ttf
Oriya MN.ttc
Oriya Sangam MN.ttc
Osaka.ttf
OsakaMono.ttf
PCmyoungjo.ttf
Pilgiche.ttf
Sinhala MN.ttc
Sinhala Sangam MN.ttc
Songti.ttc
Tamil MN.ttc
Tamil Sangam MN.ttc
Telugu MN.ttc
Telugu Sangam MN.ttc
WawaSC-Regular.otf
WawaTC-Regular.otf
WeibeiSC-Bold.otf
WeibeiTC-Bold.otf
Xingkai.ttc
Yu Gothic Bold.otf
Yu Gothic Medium.otf
Yu Mincho Demibold.otf
Yu Mincho Medium.otf
Yuanti.ttc
YuppySC-Regular.otf
YuppyTC-Regular.otf
ヒラギノ丸ゴ Pro W4.otf
ヒラギノ丸ゴ ProN W4.otf
ヒラギノ明朝 Pro W3.otf
ヒラギノ明朝 Pro W6.otf
ヒラギノ角ゴ Pro W3.otf
ヒラギノ角ゴ Pro W6.otf
ヒラギノ角ゴ Std W8.otf
ヒラギノ角ゴ StdN W8.otf
儷宋 Pro.ttf
儷黑 Pro.ttf
华文仿宋.ttf
华文细黑.ttf
华文黑体.ttf
EOF
)

while read -r line; do
  if [ -f /Library/Fonts/"$line" ]; then
    sudo rm /Library/Fonts/"$line"
  fi
done <<< "$list"
