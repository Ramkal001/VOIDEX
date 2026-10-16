pragma Singleton

import QtQuick

QtObject {
    property QtObject color: QtObject {
        readonly property color transparent: 'transparent'

        readonly property color textPrimary: '#F4F8FC'
        readonly property color textSecondary: '#CDD8E7'
        readonly property color textTertiary: '#A8BACF'
        readonly property color textQuaternary: '#8199B6'
        readonly property color textInverted: '#06101D'
        readonly property color textAccent: '#E5EEF9'
        readonly property color textStaticWhite: '#FFFFFF'

        readonly property color bgBase: '#061326'
        readonly property color bgSurface: '#0B1D34'
        readonly property color bgSurfaceAlt: '#102941'
        readonly property color bgSheet: '#10263D'
        readonly property color bgPanel: '#1A344F'
        readonly property color bgPanelAlt: '#284664'
        readonly property color bgOverlay: '#BB020A16'
        readonly property color bgStateLayer: '#16D7E7F7'
        readonly property color bgStateLayerPressed: '#24D7E7F7'
        readonly property color bgStateLayerAccent: '#28D9E6F5'
        readonly property color bgSurfaceInverse: '#E5EDF6'
        readonly property color bgSurfaceInverseAlt: '#CBD8E6'
        readonly property color bgControlTrack: '#1A344D'
        readonly property color bgField: '#102940'
        readonly property color bgSelected: '#183952'
        readonly property color bgAccentSubtle: '#304B6C8E'
        readonly property color bgStaticWhite: '#FFFFFF'

        readonly property color bgAction: '#E0E8F1'
        readonly property color bgActionHover: '#F3F7FC'
        readonly property color bgActionPress: '#BBC9D8'

        readonly property color borderFaint: '#23405C'
        readonly property color borderSoft: '#36526B'
        readonly property color borderMedium: '#57738C'
        readonly property color borderBold: '#8EA8C0'
        readonly property color borderEmphasis: '#C6D4E4'
        readonly property color borderAccent: '#B9CCDF'
        readonly property color borderField: '#58728E'
        readonly property color borderFocus: '#E4EEF9'

        readonly property color accentLight: '#CFDCEB'
        readonly property color accentDefault: '#A9BDD2'
        readonly property color accentDark: '#7895B3'
        readonly property color accentDeep: '#304E6F'

        readonly property color statusDestructive: '#FF485D'
        readonly property color statusWarning: '#FFC971'
        readonly property color statusSuccess: '#33E391'

        readonly property color promoRecommendation: '#A78BFA'
        readonly property color promoUpdate: '#38BDF8'
        readonly property color promoOverlay: '#148B5CF6'
        readonly property color promoPink: '#DB2777'
        readonly property color promoPinkDeep: '#9D174D'

        readonly property color iconDefault: '#E2EAF3'
        readonly property color iconSecondary: '#B7C8DA'
        readonly property color iconTertiary: '#5F7893'
        readonly property color iconInverted: '#071223'

        readonly property color shadowLayer1: '#26000000'
        readonly property color shadowLayer2: '#4D000000'
        readonly property color shadowGlow: '#839FCB'
    }
}
