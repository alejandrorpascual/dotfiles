export interface AlacrittyTypes {
    env:                               Env;
    window:                            Window;
    scrolling:                         Scrolling;
    font:                              Font;
    draw_bold_text_with_bright_colors: boolean;
    schemes:                           Schemes;
    colors:                            Colors;
    background_opacity:                number;
    mouse:                             Mouse;
    selection:                         Selection;
    cursor:                            Cursor;
    live_config_reload:                boolean;
    key_bindings:                      KeyBinding[];
}

export interface Colors {
    primary:        Primary;
    normal:         Bright;
    bright:         Bright;
    indexed_colors: IndexedColor[];
}

export interface Bright {
    black:   string;
    red:     string;
    green:   string;
    yellow:  string;
    blue:    string;
    magenta: string;
    cyan:    string;
    white:   string;
}

export interface IndexedColor {
    index: number;
    color: string;
}

export interface Primary {
    background: string;
    foreground: string;
}

export interface Cursor {
    style:            string;
    unfocused_hollow: boolean;
}

export interface Env {
    TERM: string;
}

export interface Font {
    normal:       Normal;
    bold:         Bold;
    italic:       Bold;
    size:         number;
    offset:       GlyphOffset;
    glyph_offset: GlyphOffset;
}

export interface Bold {
    style: string;
}

export interface GlyphOffset {
    x: number;
    y: number;
}

export interface Normal {
    family: string;
    style:  string;
}

export interface KeyBinding {
    key:   string;
    mods:  string;
    chars: string;
}

export interface Mouse {
    hide_when_typing: boolean;
}

export interface Schemes {
    NighFox: Colors;
    DawnFox: Colors;
}

export interface Scrolling {
    history:    number;
    multiplier: number;
}

export interface Selection {
    semantic_escape_chars: string;
    save_to_clipboard:     boolean;
}

export interface Window {
    dimensions:      Dimensions;
    padding:         GlyphOffset;
    dynamic_padding: boolean;
    decorations:     string;
    startup_mode:    string;
}

export interface Dimensions {
    columns: number;
    lines:   number;
}
