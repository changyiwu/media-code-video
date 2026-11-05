# lemo-opuscar（上游參考）

上游：[lemomo-ai/lemo-opuscar](https://github.com/lemomo-ai/lemo-opuscar)，版本 `bebbbe1`（2026-11-01），MIT（見本資料夾 `LICENSE`）。
資料夾結構照上游原樣，文件保留上游英文原文、未改動；只有本檔是本專案寫的中文說明。選畫風先看專案根目錄的 [畫風索引](../../畫風索引.md)。

## 有什麼

| 檔案 | 用途 |
|---|---|
| `DIRECTOR.md` | 導演方法：接需求、找標竿、寫 treatment、聲音與節奏優先、鏡頭、表演、交片前檢查、著作權紅線 |
| `TECHNIQUE.md` | 製作技術：畫面是時間的函式、一條時間軸驅動全部、配音、配樂、音效與混音、字幕、試片迴圈、3D、程式畫角色 |
| `styles/INDEX.md` | 66 種畫風的索引（上游叫 `styles/README.md`，本專案改名） |
| `styles/<畫風>/` | `STYLE.md`（畫風規則）、`DEMO.md`（示範片拆解）、`style.json`、`demo/`（示範片原始程式、`build.sh`、配樂與混音腳本、`CREDITS`） |
| `core/README.md` | `core/` 的指令速查與頁面約定（`window.render(t)`、`window.READY`、`window.DUR`、`window.TEXTS`） |
| `core/render/` | 無頭瀏覽器逐格擷取（`video.mjs`、`still.mjs`）、事件匯出、閱讀時間檢查、合成（`mux.sh`）、字幕、聯絡表 |
| `core/audio/` | 程式合成音效、撥弦、取樣器（需要 scipy） |
| `core/tts/` | 配音（Kokoro 離線英文、edge-tts 中文）與 Whisper 校對 |
| `core/lib.js`、`core/post/`、`core/three/` | 畫面共用函式、CRT 後製、Three.js 後製 |
| `core/fonts/`、`core/assets/polyhaven/` | 字型子集（SIL OFL 1.1，見 `core/fonts/OFL.md`）、Poly Haven 模型（CC0；貼圖 .jpg 未收，要用時到 `SOURCES.md` 的網址下載） |
| `tools/fetch.sh`、`tools/assets.json` | 從上游 GitHub release 下載大型素材（Kokoro 模型、HDRI、樂器取樣庫） |
| `package.json`、`requirements*.txt` | 上游的 Node 與 Python 相依套件清單 |

各示範片 `demo/CREDITS` 列出它用到的外部資料與授權（例如 `white-model` 的 3DBAG 資料採 CC BY 4.0）。

## 跟本專案規則衝突的地方（以本專案為準）

- `DIRECTOR.md` §1「問一次就不再問」：本專案仍要先出計畫或分鏡給使用者確認。
- 文件提到的 `plugin/skills/lemo-opuscar/scripts/setup.sh`、`AGENTS.md` 刻意沒收；安裝相依套件照 `package.json`、`requirements*.txt` 自己裝。
- 上游文件叫你去別處找畫風時，一律改看本專案的 [畫風索引](../../畫風索引.md)。

## 沒收的上游內容

- `README*`（上游介紹頁）、`MAINTAINING.md`（上游維護者用）、`MY-STYLES.md`（自製畫風流程，本專案自寫的畫風放 `styles/`）。
- `styleboard/`（上游畫風展示網站）、`styles/_template/`、`tools/` 的發布工具（`publish.sh`、`release.py`、`directory*`、`web_cuts.sh`）。
- 上游的 `CLAUDE.md`、`AGENTS.md`、`SKILL.md`、`plugin/`：會蓋過本專案的流程，**不要補回來**。
- 樣片影片與字幕（`.mp4`、`.srt`）、所有 `.jpg`（`poster.jpg` 與 `demo/stills/` 的靜幀屬 CC BY 4.0），以及上游 git 本來就不收的字型、配音、音樂檔（`CREDITS` 有寫怎麼找回來）。

## 要實際跑示範片時

結構照上游擺，示範片的相對路徑（例如 `../../../core/lib.js`）可以直接對上；`build.sh` 要從本資料夾（上游根目錄）執行。
算圖的中間檔與成品照 AGENTS.md 寫到本機暫存資料夾，不要寫進雲端硬碟；必要時把整個 `upstream/lemo-opuscar/` 複製到本機暫存資料夾再跑。
