# VOIDEX — Cosmic Android interface (work in progress)

This branch contains the first actual QML implementation of the approved navy-and-white VOIDEX concept. It is **not a tested APK**. It extends the GPL-3.0 AmneziaVPN client and keeps the real VPN engine.

## Implemented in source
- Navy and titanium-white palette in the shared Qt/QML styling singleton.
- A three-dimensional metallic CONNECT control whose border uses `ConnectionController.isConnected`: red when disconnected, green when connected, pale blue while connecting. The click still calls `ConnectionController.connectButtonClicked()`.
- An original dark-space SVG background and a VOIDEX home-screen header.
- Active server selection through the existing `ServersUiController`; add-server action opens the existing setup wizard. Country flag uses the backend flag image where one is available. The fallback is a globe, never an invented flag.
- Split Tunneling retains the upstream controllers and menus.
- Technical protocol names are not displayed in the main home summary (the advanced settings remain functional).
- VOIDEX title and a separate Android application ID `net.voidex.private`, plus an adaptive launcher icon and welcome logo.

## Still required before release
1. Build with a compatible Qt for Android, Android SDK/NDK, CMake, Conan, and native VPN libraries. The upstream project is substantial. The stock upstream Android GitHub workflow references a custom `android-runner`; it will not produce a usable APK on a basic fork without a runner/toolchain configuration.
2. Test Qt/QML rendering on a real Android device. The cosmic artwork is an SVG recreation; it is **not** a direct embedding of the original photorealistic mockup. Further design iteration is needed for an exact visual match.
3. Test status transitions, permission prompts, reconnect, country flags, add/import-server flow, Split Tunneling, DNS and IPv6 leak behavior.
4. Keep upstream AmneziaVPN installed and working until VOIDEX is validated. The app ID is different, so existing connection profiles do not automatically migrate. Import the connection in the new app through the app's own import flow, preferably a separate client profile.
5. Review Android launcher assets for older Android versions (the adaptive vector icon covers newer Android versions). Obtain a signing key for release distribution.
6. Follow GPL-3.0 and third-party license obligations when redistributing a modified client.

## IMPORTANT SECURITY RULE
Never commit server passwords, SSH private keys, QR codes, AmneziaWG/WireGuard private keys, or full client configurations to this public repository. Server address and tunnel secrets should be entered on device, not embedded in source.

## Repository and development
- Main branch: `dev` — remains unchanged until reviewed.
- Work branch: `feature/voidex-cosmic-ui`.
- User's existing VPN server is not modified by these QML and Android client changes.

The UI name VOIDEX is a proposed brand name; trademark checks are separate from software development.
