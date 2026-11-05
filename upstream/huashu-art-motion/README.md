# huashu-art-motion（上游參考）

上游：[alchaincyf/huashu-art-motion](https://github.com/alchaincyf/huashu-art-motion)（花叔），版本 `8a0d7d7`（2026-10-17），MIT（見本資料夾 `LICENSE`）。
資料夾結構照上游原樣，程式保留上游原文、未改動；`references/` 照下方〈已移除〉刪過整行。只有本檔是本專案寫的中文說明。選畫風先看專案根目錄的 [畫風索引](../../畫風索引.md)。

## 有什麼

| 位置 | 用途 |
|---|---|
| `references/01`–`16`、`镜头语言.md`、`镜头表模板.md`、`角色*.md` | 做片方法：拆解、機制、一幀先行、純程式繪製、節奏與配樂、口播短片、角色、鏡頭語言 |
| `references/风格配方/` | 40 種畫風配方與 `INDEX.md` |
| `references/色板.md`、`references/动画语法/` | 色板、動畫語法 |
| `scripts/engine/engine.js`、`eras.js`、`index.html` | 整片引擎：依 `eras.js` 的段落清單逐段播放各時代場景 |
| `scripts/engine/clip.js`、`clip.html`、`clip_schema.json`、`clips/` | 參數化片段：用 JSON spec 套版做單支短片（收 `t3_finance_chart`、`y3_whiteboard`、`y4_storytime`、`y5_kinetic_type` 四種） |
| `scripts/engine/transitions.js` | 轉場庫 |
| `scripts/engine/scenes/` | 40 種已收畫風各自的場景程式，`index.js` 是登記表 |
| `scripts/engine/lib/` | 畫法程式：`util`、`paint`、`brush`、`camera`、`chart`、`collage`、`diagram`、`finish`、`kit`、`media`、`medium`、`motion`（緩動）、`palettes`、`post`、`render`、`rig`、`toon`、`typo`、`ui`；`three.min.js`（MIT，見 `THREE_LICENSE.txt`） |
| `scripts/engine/lib/fonts/` | 48 個字型，全是 SIL OFL 1.1（授權表 `LICENSES.md`、全文 `OFL.txt`）；帶保留名的字型改字形或抽子集時要改 family 名 |
| `scripts/engine/demos/`、`examples/` | 示範片：`t3_finance_chart`（財經圖表）、`y5_kinetic_type`（動態文字） |
| `scripts/engine/render.py`、`audit_clip.py`、`compare.py`、`spec_assets.py` | 算圖、片段檢查、比對、素材整理 |
| `scripts/*.py` | 品質把關：`clip_lint`、`storyboard_lint`（分鏡檢查）、`film_gate`（整片門禁，需要 opencv）、`qa`、`subzone_gate`（字幕帶檢查）、`deliver`（交片）、`font_subset`（字型子集） |
| `scripts/analyze/` | 拆解與比對：`breakdown`、`side_by_side`、`stress_clip`、`regress_clips` |

Python 工具多數用 `uv run` 的 inline 相依宣告（numpy、pillow、playwright、fonttools）。

## 使用注意（以本專案為準）

- **核心程式保留原樣**，註解與函式名稱會以被移除的畫風或頻道當技法出處（例如 `P.kirbyShade`、「3b1b 色板」、`transitions.js` 裡通往已移除畫風的轉場、`eras.js` 與 `scenes/index.js` 列到的已移除場景）。
  這些名稱只說明技法來源：**不要拿來模仿具體作品，也不要寫進對外文案**；`eras.js` 預設清單裡缺檔的段落要先拿掉才跑得起來。
- `index.html` 會載入沒收的 `lib/rig_huashu.js`（作者本人的卡通形象），跑之前把那行拿掉。
- 上游流程說明跟本專案工作約定衝突時（例如不先確認就動手），以本專案為準。
- 算圖的中間檔與成品寫本機暫存資料夾，不要寫進雲端硬碟。

## 沒收的上游內容

- **點名頻道、公司或作品的**：`t1_3b1b`、`t2_keynote_ui`、`y1_kurzgesagt`、`y2_vox` 的示範片、clips 與 examples，`examples/t2_fullbleed_pulse.json`，`reference_films/`（`rick_morty`、`spacex`）。
- **已移除畫風的場景與清單**：`scenes/` 的 `13_pop`、`21_kusama`、`23_dali`、`24_hopper`、`25_ghibli`、`27_kirby`、`31_haring`、`35_shinkai`、`36_picasso_blue`、`49_chagall`、`52_south_park`、`53_pixar`、`54_ghibli_lab`；`eras_gallery.js`、`eras_style_studies.js`。
- **作者本人的卡通形象**：`lib/rig_huashu.js`，以及以它為主角的 `demos/_shared/`、`y3_whiteboard`、`y4_storytime`、`long_scroll` 示範片。
- **綁外部服務的**：`koubo.py`、`capabilities.py`、`voice_review.py`（火山引擎聲音複刻）、`images.py`、`key_green.py`、`key_split.py`（生圖與綠幕摳圖）、`analyze/fetch_reference.py`（下載參考片）、`defaults/`、`schemas/`。
- **上游自己用的**：`SKILL.md`、`CHANGELOG.md`、`CONTRIBUTING.md`、`README*`、`release-manifest.json`、`check_release.py`、`.github/`、`assets/`（展示圖與影片）、`scripts/audio/`。

## 已移除

見 [畫風索引〈已移除〉](../../畫風索引.md#已移除)。`references/` 裡提到那些畫風的整行文字已刪，所以部分表格與段落比上游短。
