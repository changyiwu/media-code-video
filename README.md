# media-code-video

直接用程式寫出畫面的影片：動態設計、知識解說、程式畫的 3D 場景。畫面用 Canvas 2D、SVG、WebGL／Three.js 或 Python 逐格算出來，不用影片生成模型。

本 repo 只放**規則、畫風庫與工具**；作品本身（影片、圖片、工作檔）都在 `output/`，不進 git，只走雲端硬碟同步。
歌詞 MV 在 `media-music-video`、ComfyUI 劇情短片在 `media-short-film`、純 Blender 作品在 `media-3d-studio`。

## 開始之前

- 先讀 [AGENTS.md](AGENTS.md)（專案藍圖），再讀 `handoff.md`（上次做到哪，不進 git）。
- 開新作品照 [docs/production-sop.md](docs/production-sop.md)。
- 選畫風看 [styles/README.md](styles/README.md)。
- 跑一次 `sh tools/vendor.sh`，把下面兩個參考 repo 抓到 `vendor/`。

## 參考來源

| repo | 用途 | 怎麼放 |
|---|---|---|
| [lemomo-ai/lemo-opuscar](https://github.com/lemomo-ai/lemo-opuscar) | 66 種用程式做片的畫風，每種附一支示範片；`DIRECTOR.md`（導演方法）、`TECHNIQUE.md`（製作技術） | 畫風文字已篩過收進 `styles/lemo-opuscar/`；完整 repo 由 `tools/vendor.sh` 抓到 `vendor/`（不含 .jpg 靜幀與上游的 agent 指令檔） |
| [yihui-dev/awesome-opus5-5-videos](https://github.com/yihui-dev/awesome-opus5-5-videos) | 703 則用 Claude Opus 5.5 寫程式做的影片與它們的提示詞 | 只放連結；`tools/vendor.sh` 抓到 `vendor/` 本機參考，提示詞版權屬原作者，不重新散布 |
| [alchaincyf/huashu-art-motion](https://github.com/alchaincyf/huashu-art-motion) | 畫風配方、動畫語法與少量畫法程式 | 已篩過收進 `styles/huashu-art-motion/` |

## 目錄

```text
media-code-video/
├── AGENTS.md        專案藍圖（規則都在這裡）
├── CLAUDE.md        Claude Code 橋接檔（@AGENTS.md）
├── docs/            製作 SOP
├── styles/          畫風庫（見 styles/README.md）
├── tools/vendor.sh  抓參考 repo 到 vendor/
├── templates/       發布資訊範本.md
├── vendor/          參考 repo 的本機副本（不進 git）
└── output/          作品，`output/<類型>/<作品名>/`（類型：動態設計；不進 git）
```

## 需要的環境

- Node.js、Edge 或 Chrome（無頭瀏覽器逐格擷取）、ffmpeg
- Python＋numpy（配樂與音效）；作品腳本不依賴 scipy（Windows 智慧型應用程式控制會擋它的 DLL）
- Git Bash（Windows 上執行 `tools/vendor.sh`）

## 授權

- 本專案自寫的程式與文件採 [MIT](LICENSE)。
- [templates/發布資訊範本.md](templates/發布資訊範本.md) 例外：改作自山獅霸的多重宇宙的範本，採 [CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/deed.zh-hant)（不可商用），出處寫在該檔末尾。
- `styles/lemo-opuscar/`、`styles/huashu-art-motion/` 是 MIT 授權的上游內容，授權檔在各自資料夾，著作權屬原作者。
