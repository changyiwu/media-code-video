# media-code-video

直接用程式寫出畫面的影片：動態設計、知識解說、程式畫的 3D 場景。畫面用 Canvas 2D、SVG、WebGL／Three.js 或 Python 逐格算出來，不用影片生成模型。

本 repo 只放**規則、畫風庫與工具**；作品本身（影片、圖片、工作檔）都在 `output/`，不進 git，只走雲端硬碟同步。
歌詞 MV 在 `media-music-video`、ComfyUI 劇情短片在 `media-short-film`、純 Blender 作品在 `media-3d-studio`。

## 開始之前

- 先讀 [AGENTS.md](AGENTS.md)（專案藍圖），再讀 `handoff.md`（上次做到哪，不進 git）。
- 開新作品照 [docs/production-sop.md](docs/production-sop.md)。
- 選畫風看 [畫風索引.md](畫風索引.md)。
- 做片方法看 [upstream/lemo-opuscar/](upstream/lemo-opuscar/README.md)、[upstream/huashu-art-motion/](upstream/huashu-art-motion/README.md)。

## 參考來源

| repo | 用途 | 怎麼放 |
|---|---|---|
| [lemomo-ai/lemo-opuscar](https://github.com/lemomo-ai/lemo-opuscar) | 66 種用程式做片的畫風，每種附一支示範片；`DIRECTOR.md`（導演方法）、`TECHNIQUE.md`（製作技術） | 照上游結構收進 `upstream/lemo-opuscar/`：畫風文字、示範片程式、導演方法、製作技術與 `core/` 引擎（不含 .jpg 靜幀、樣片影片與上游的 agent 指令檔） |
| [yihui-dev/awesome-opus5-5-videos](https://github.com/yihui-dev/awesome-opus5-5-videos) | 703 則用 Claude Opus 5.5 寫程式做的影片與它們的提示詞 | 只放連結；提示詞版權屬原作者，不重新散布 |
| [alchaincyf/huashu-art-motion](https://github.com/alchaincyf/huashu-art-motion) | 畫風配方、動畫語法、做片方法、整片與片段引擎、品質把關工具 | 已篩過、照上游結構收進 `upstream/huashu-art-motion/`（不含點名頻道或作品的示範片、作者本人的卡通形象、綁外部服務的工具） |

## 目錄

```text
media-code-video/
├── AGENTS.md        專案藍圖（規則都在這裡）
├── CLAUDE.md        Claude Code 橋接檔（@AGENTS.md）
├── docs/            製作 SOP
├── 畫風索引.md      選畫風的總索引
├── styles/          本專案自寫的畫風
├── upstream/        上游參考，一個上游一個資料夾（畫風、做片方法、程式）
├── templates/       發布資訊範本.md
└── output/          作品，`output/<作品名>/`（不進 git）
```

## 需要的環境

- Node.js、Edge 或 Chrome（無頭瀏覽器逐格擷取）、ffmpeg
- Python＋numpy、scipy（配樂與音效；Windows 要先關閉智慧型應用程式控制，否則會擋 scipy 的 DLL）

## 授權

- 本專案自寫的程式與文件採 [MIT](LICENSE)。
- [templates/發布資訊範本.md](templates/發布資訊範本.md) 例外：改作自山獅霸的多重宇宙的範本，採 [CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/deed.zh-hant)（不可商用），出處寫在該檔末尾。
- `upstream/` 底下是 MIT 授權的上游內容，授權檔在各自資料夾，著作權屬原作者。
  `upstream/lemo-opuscar/core/fonts/`、`upstream/huashu-art-motion/scripts/engine/lib/fonts/` 的字型採 SIL OFL 1.1（見各資料夾的授權檔），`three.min.js` 採 MIT，`core/assets/polyhaven/` 的模型採 CC0；
  各示範片 `demo/CREDITS` 列出它用到的外部資料與授權（例如 `white-model` 的 3DBAG 資料採 CC BY 4.0）。
