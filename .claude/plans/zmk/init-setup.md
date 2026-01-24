# ZMK Setup Plan: Sofle Choc Pro BT with Swedish Layout

**Status:** ✅ Complete - Initial setup done, keyboard flashed and working

## Summary

Successfully configured Keebart Sofle Choc Pro BT with:
- Swedish-optimized base layer
- Combos for å ä ö (adjacent key presses)
- Bracket mod-morphs on RAISE layer
- Tilde macro
- Full build/flash workflow via GitHub Actions

## Current Layout

See `~/dotfiles/zmk-config/README.md` for full documentation.

### Quick Reference

```text
Base Layer:
┌─────┬─────┬─────┬─────┬─────┬─────┐         ┌─────┬─────┬─────┬─────┬─────┬─────┐
│  §  │  1  │  2  │  3  │  4  │  5  │         │  6  │  7  │  8  │  9  │  0  │BSPC │
├─────┼─────┼─────┼─────┼─────┼─────┤         ├─────┼─────┼─────┼─────┼─────┼─────┤
│ ESC │  Q  │  W  │  E  │  R  │  T  │         │  Y  │  U  │  I  │  O  │  P  │ RET │
├─────┼─────┼─────┼─────┼─────┼─────┤         ├─────┼─────┼─────┼─────┼─────┼─────┤
│ TAB │  A  │  S  │  D  │  F  │  G  │         │  H  │  J  │  K  │  L  │  '  │ +/? │
├─────┼─────┼─────┼─────┼─────┼─────┤         ├─────┼─────┼─────┼─────┼─────┼─────┤
│SHFT │  Z  │  X  │  C  │  V  │  B  │         │  N  │  M  │ ,;  │ .:  │ -_  │SHFT │
└─────┴─────┼─────┼─────┼─────┼─────┤         ├─────┼─────┼─────┼─────┼─────┴─────┘
            │ GUI │ ALT │CTRL │ LWR │ SPC SPC │ RSE │CTRL │ ALT │ GUI │

Combos: P+RET=å  L+'=ö  '+?=ä

RAISE: ESDF/IJKL=arrows, 8/9=[/], Shift+8/9={/}, Z=<>, +/?=~
ADJUST (LWR+RSE): 1-5=BT devices, §=BT clear
```

## Build & Flash Workflow

```bash
# 1. Edit keymap
cd ~/dotfiles/zmk-config
$EDITOR config/sofle_choc_pro.keymap

# 2. Commit & push
git add -A && git commit -m "feat: description" && git push

# 3. Trigger build
gh workflow run "Build ZMK firmware" --repo LinusOstlund/zmk-config

# 4. Watch & download
gh run list --repo LinusOstlund/zmk-config --limit 1
gh run download <id> --repo LinusOstlund/zmk-config --dir firmware

# 5. Flash (double-tap reset first)
cp firmware/firmware/*left*.uf2 /Volumes/KEEBART/
cp firmware/firmware/*right*.uf2 /Volumes/KEEBART\ 1/
```

## Key Technical Notes

### Swedish OS Keycodes
ZMK sends US HID codes, Swedish OS interprets them:
- `LBKT` → å, `SEMI` → ö, `SQT` → ä
- `COMMA` → ,; `DOT` → .: `FSLH` → -_
- `MINUS` → +? `BSLH` → '*

### Brackets via Mod-Morph
Custom behaviors in keymap:
- `bkt_l`: RAISE+8 = `[`, Shift+RAISE+8 = `{` (sends RA(N8) or RA(N7))
- `bkt_r`: RAISE+9 = `]`, Shift+RAISE+9 = `}` (sends RA(N9) or RA(N0))

### Tilde Macro
Swedish ~ is a dead key. Macro sends `RA(RBKT) SPACE` to produce standalone ~.

## Backlog

- [ ] @ combo (Q+W?)
- [ ] Caps Word
- [ ] Home row mods
- [ ] Mouse keys
- [ ] Common phrase macros
- [ ] Local Podman build (currently uses GitHub Actions)

## Resources

- Repo: https://github.com/LinusOstlund/zmk-config
- Terminal cheat sheet: `wtfzmk`
- ZMK docs: https://zmk.dev/docs
