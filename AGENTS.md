# media-code-video（專案藍圖）

> 本檔為跨 Agent 通用的專案藍圖（AGENTS.md 開放標準）。任何 Agent 的每個 session 都應先讀本檔＋`handoff.md`。
> Claude Code 預設只在沒有 `CLAUDE.md` 時才讀 `AGENTS.md`，故由 `CLAUDE.md` 的 `@AGENTS.md` import 本檔（`CLAUDE.md` 只有這一行）；Claude 專屬規範寫在本檔〈Claude Code 專屬〉一節。

## 專案簡介

做**直接用程式寫出畫面的影片**：動態設計、知識解說、程式畫的 3D 場景等，畫面用 Canvas 2D、SVG、WebGL／Three.js 或 Python 逐格算出來，
**不用影片生成模型**；配樂與音效用 numpy 合成或使用者提供。本專案放畫風庫、製作方法與作品本身。

不在這裡做的：
- **歌詞 MV、有歌的配樂影片** → `media-music-video`（歌以歌為主；畫風照本專案 `畫風索引.md` 挑）
- 用 ComfyUI（H3）做的劇情短片 → `media-short-film`
- 純 Blender 作品 → `media-3d-studio`

## 關鍵時程

- 2026-10-09：〈動態設計作品集〉15 秒 showreel 在 `media-music-video` 完成（Canvas 2D 逐格＋numpy 配樂；另有 HyperFrames 比較版）
- 2026-11-01：畫風庫（lemo-opuscar、huashu-art-motion 的畫風文字）在 `media-music-video/styles/` 建立
- 2026-11-05：專案初始化，從 `media-music-video` 拆出：搬入 `output/動態設計/` 與 `styles/`；lemo-opuscar、awesome-opus5-5-videos 以 `vendor/` 參考（不進 git）
- 2026-11-05：改成一個上游一個資料夾 `upstream/<上游>/`（照上游結構，含畫風、做片方法與程式）；lemo-opuscar 收進導演方法、`core/` 引擎與 66 支示範片程式（`bebbbe1`），huashu-art-motion 補收引擎、場景、字型與品質工具（`8a0d7d7`，點名頻道與作者形象的不收）；
  `styles/` 只放本專案自寫的畫風，總索引在根目錄 `畫風索引.md`；刪除 `vendor/` 與 `tools/vendor.sh`，awesome-opus5-5-videos 只留連結；
  拿掉 `output/動態設計/` 類型層，作品資料夾改成 `output/<作品名>/`
- 2026-11-06：第一支新作品〈一滴墨〉（水墨無限縮放、一鏡到底可循環、9:16、36 秒）定案；試出來的規則寫進 `docs/production-sop.md` 第二節
- 2026-11-06：第二支作品〈城市生長〉（低多邊形城市從空地長出來、Three.js、9:16、35 秒、可循環）定案；程式 3D、生長對拍、換地點接回開頭的規則寫進 `docs/production-sop.md` 第二節

## 目標與路線圖

- [x] 階段一：從 `media-music-video` 拆出，搬入〈動態設計作品集〉與畫風庫
- [x] 階段二：用 lemo-opuscar 的導演方法做第一支新作品〈一滴墨〉，把試出來的本專案規則寫進 `docs/production-sop.md`（2026-11-06）
- [x] 階段三：第二支作品〈城市生長〉（空地長成城市），沿用 SOP 第二節的做法並補充新規則（2026-11-06）

## 資料夾結構

```
media-code-video/
├── AGENTS.md            本檔（專案藍圖）
├── handoff.md           交接檔（不進 git）
├── CLAUDE.md            橋接檔（@AGENTS.md）
├── README.md            對外說明、參考來源與授權
├── LICENSE              MIT（例外見 README〈授權〉）
├── docs/                production-sop.md（開新作品、出片、發布把關；共用的畫面規則與 metadata 清除指向 media-music-video）
├── 畫風索引.md          選畫風的總索引：三個來源在哪、怎麼選、怎麼署名、已移除清單
├── styles/              本專案自寫的畫風筆記（水墨一筆、沙畫）
├── upstream/            上游參考，一個上游一個資料夾，結構照上游原樣（MIT）；各有中文 README.md 說明收了什麼、沒收什麼
│   ├── lemo-opuscar/        DIRECTOR.md（導演方法）、TECHNIQUE.md（製作技術）、core/（算圖、配音、混音工具）、styles/（66 種畫風＋示範片程式 demo/）
│   └── huashu-art-motion/   references/（做片方法、风格配方/ 40 種、色板、动画语法）、scripts/engine/（整片與片段引擎、轉場、場景、lib/ 畫法程式與字型）、scripts/（品質把關工具）
├── templates/           發布資訊範本.md（正本在 media-youtube-publish，見〈專案專屬規則〉）
├── output/              所有產出（不進 git，只走雲端硬碟同步）；一件作品一個資料夾 `output/<作品名>/`
│   ├── 動態設計作品集/   15 秒 showreel（Canvas 2D 逐格＋Headless Edge 擷取＋numpy 配樂）；最上層是定案成品與封面
│   │   └── work/         reel/（Canvas 版原始專案）、hf/（HyperFrames 比較版，配樂共用）
│   ├── 一滴墨/           36 秒循環水墨（五層套疊無限縮放＋numpy 配樂）；最上層是定案成品、發布資訊
│   │   └── work/         film.html＋src/（ink.js 水墨引擎、film.js 套疊與鏡頭）、tools/（render.mjs 算圖、score.py 配樂）、定格/、舊版/
│   └── 城市生長/         35 秒循環低多邊形城市（Three.js 逐格＋事件驅動 numpy 配樂）；最上層是定案成品、封面、發布資訊
│       └── work/         film.html＋src/（story.js 時間表與鏡頭、world.js 城市與生長、post.js 後製）、vendor/three/、tools/（render.mjs、score.py、beatcheck.mjs）、定格/、舊版/
└── scratch/             暫存（不進 git）
```

## 專案專屬規則

- **不用影片生成模型**：畫面一律程式算出來。底圖、貼圖要用生圖時在作品的 `製作紀錄.md` 寫明，並照發布資訊範本揭露。
- **選畫風照根目錄 `畫風索引.md` 挑**，只從本專案 `styles/` 與 `upstream/` 已收的畫風選。要從上游新版補內容（畫風、示範片、程式）時，照 `畫風索引.md`〈已移除〉的標準先審查再收，不收點名公司、作品、頻道或在世藝術家的內容。
- **`upstream/` 只當參考**：上游的流程說明（例如 `DIRECTOR.md` 的「問一次就不再問」）跟本專案的工作約定衝突時，以本專案為準——仍要先出計畫或分鏡給使用者確認。
  不要把上游的 `AGENTS.md`、`CLAUDE.md`、`SKILL.md`、`plugin/` 收進來。
- **awesome-opus5-5-videos 的提示詞版權屬各原作者**：不收進專案，要參考時上 GitHub 看；作品參考了哪一則，在 `製作紀錄.md` 寫出處連結。
- **畫面規則與發布把關不另存一份**：人物、動作、畫面變化、程式算圖平行程序數、試片驗收紀錄、metadata 清除與雙重驗證，
  正本在 `media-music-video` 的 `docs/production-sop.md`（第四、五節），本專案 `docs/production-sop.md` 只放指向與本專案特有的部分。
- **本 repo 是公開的**：使用者的照片、聲音、完整提示詞、本機絕對路徑與真實電腦名只放在 `output/` 與 `handoff.md`（都不進 git）；
  文件裡提到時用通稱（例如「電腦 A」）。commit 前用 `git diff --cached` 確認沒有夾帶。
- **社群發布文案照 [templates/發布資訊範本.md](templates/發布資訊範本.md)**：作品驗收通過後複製成 `output/<作品名>/發布資訊.md`。
  範本在各媒體專案各一份、內容逐位元組相同，正本在 media-youtube-publish 的 `skills/youtube-long/references/`，改正本再整份覆蓋，不在本專案就地改。
- **對外發布的成品另存一份清掉 metadata 的版本**，用 `ffprobe` 與位元組掃描驗證（指令見 `media-music-video/docs/production-sop.md` 第四節）。
- **聲音由使用者試聽**（agent 聽不到）。
- 每件作品一個資料夾 `output/<作品名>/`（作品名用中文標題），至少有 `製作紀錄.md`；不分類型層（2026-11-05 拿掉 `動態設計/`）。
  定案成品放最上層、改名 `<作品名>.mp4`（社群壓縮版 `_社群版.mp4`、720p `_手機版.mp4`）；之前一律留在 `work/`，舊版放 `舊版/`。
- 程式算圖的中間檔（上千張分鏡 PNG、配樂 wav）**放本機暫存資料夾，不要放進雲端硬碟**；成品也先寫本機暫存，算完再搬進作品資料夾。
- **音訊與訊號處理可用 numpy、scipy**：各電腦已關閉 Windows 智慧型應用程式控制（它會擋 scipy 的 DLL）；換到還開著它的電腦時，先關掉或改用純 numpy。
- 換電腦重現作品前，先等該作品的資料夾雲端同步完成，再調整 `local-config.json`；本機設定檔不提交 Git。

## 同步層級（本專案初始化至第三層級）

| 層級 | 平台 | 位置 | 讀取時機 |
|------|------|------|---------|
| L1 | 本地（GDrive） | `AGENTS.md`＋`handoff.md`（不進 git，只走雲端硬碟）＋`CLAUDE.md`（橋接） | 每個 session |
| L2 | GitHub | [changyiwu/media-code-video](https://github.com/changyiwu/media-code-video)（**公開**） | 指定時 |
| L3 | Obsidian | `media-code-video/專案工作流程.md` | 有需要時 |

## 三個檔案的職責（依「時效性」分家，不是依「詳細程度」）

| 檔案 | 時效 | 寫入方式 | 放什麼 |
|------|------|---------|--------|
| `handoff.md` | **只對下一個 session 有效**，過期即丟 | 每次收工**整份重寫** | 做到哪、下一步、**這次**的暫時 workaround |
| `AGENTS.md`（本檔） | **長期有效**，每個 session 都適用 | 只有規則本身變了才改 | 目標、路線圖、常設規則、結構 |
| Obsidian（L3）／`git log` | **歷史**：發生過什麼、為什麼 | 只增不刪 | 決策紀錄、踩坑完整版、逐次進度 |

驗收標準：**`handoff.md` 整份刪掉，不應損失任何長期資訊**——會的話代表該升級進本檔卻沒升級。

**本檔不要出現的東西**（會無限膨脹，且開工每次都要重讀）：
- ❌ `## 最近進度`／逐次工作紀錄 → 寫 Obsidian「🗓️ 最近更動紀錄」
- ❌ 決策記錄、取捨理由、踩坑經過的完整版 → Obsidian「決策紀錄」「🕳️ 踩坑筆記」
- ✅ 只留「結論式的規則」：踩過的坑收斂成一條**祈使句**寫進〈工作約定〉或〈專案專屬規則〉，理由那一大段留在 Obsidian

## 工作約定
- 任何 Agent、任何電腦：**開工先讀 `handoff.md`，收工必更新 `handoff.md`**
- `handoff.md` **不進 git**（含真實電腦名與本機絕對路徑），已列入 `.gitignore`，跨電腦靠雲端硬碟同步——不要把它加回版控
- 修改共用檔案前先讀最新內容，避免覆蓋其他 Agent 的變更
- 所有回應與文件使用繁體中文
- 修改前先確認計畫，優先保留原有資料結構
- **產出一律放 `output/`**：本專案產生的檔案或資料夾（成品、匯出、報表、生成圖、渲染等）預設放專案根目錄的 `output/`，不另開 `outputs/`、`exports/`、`generated/`、`out/` 之類的資料夾，方便找；`output/` 不進 git。部署工具指定的建置目錄（`dist/`、`build/`）不在此限。本專案每件作品一個 `output/<作品名>/`，定案成品放最上層、工作檔放 `work/`、舊版放 `舊版/`
