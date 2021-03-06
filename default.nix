{ pkgs ? import <nixpkgs> {} }:
s: let
  inherit (pkgs.lib.lists) genList length flatten;
  inherit (pkgs.lib.strings) replaceStrings;
  inherit (pkgs.lib.trivial) const;
  inherit (pkgs.lib.attrsets) attrValues mapAttrsToList;

  i = {
    A = [ "À" "Á" "Â" "Ã" "Ä" "Å" "Ā" "Ă" "Ą" ];
    a = [ "à" "á" "â" "ã" "ä" "å" "ā" "ă" "ą" ];
    C = [ "Ç" "Ć" "Ĉ" "Ċ" "Č" ];
    c = [ "ç" "ć" "ĉ" "ċ" "č" ];
    D = [ "Ð" "Ď" "Đ" ];
    d = [ "ð" "ď" "đ" ];
    E = [ "È" "É" "Ê" "Ë" "Ē" "Ĕ" "Ė" "Ę" "Ě" ];
    e = [ "è" "é" "ê" "ë" "ē" "ĕ" "ė" "ę" "ě" ];
    G = [ "Ĝ" "Ğ" "Ġ" "Ģ" ];
    g = [ "ĝ" "ğ" "ġ" "ģ" ];
    H = [ "Ĥ" "Ħ" ];
    h = [ "ĥ" "ħ" ];
    I = [ "Ì" "Í" "Î" "Ï" "Ĩ" "Ī" "Ĭ" "Į" "İ" ];
    i = [ "ì" "í" "î" "ï" "ĩ" "ī" "ĭ" "į" "ı" ];
    J = [ "Ĵ" ];
    j = [ "ĵ" ];
    K = [ "Ķ" ];
    k = [ "ķ" "ĸ" ];
    L = [ "Ĺ" "Ļ" "Ľ" "Ŀ" "Ł" ];
    l = [ "ĺ" "ļ" "ľ" "ŀ" "ł" ];
    N = [ "Ñ" "Ń" "Ņ" "Ň" "Ŋ" ];
    n = [ "ñ" "ń" "ņ" "ň" "ŋ" ];
    O = [ "Ò" "Ó" "Ô" "Õ" "Ö" "Ø" "Ō" "Ŏ" "Ő" ];
    o = [ "ò" "ó" "ô" "õ" "ö" "ø" "ō" "ŏ" "ő" ];
    R = [ "Ŕ" "Ŗ" "Ř" ];
    r = [ "ŕ" "ŗ" "ř" ];
    S = [ "Ś" "Ŝ" "Ş" "Š" ];
    s = [ "ś" "ŝ" "ş" "š" "ſ" ];
    T = [ "Ţ" "Ť" "Ŧ" ];
    t = [ "ţ" "ť" "ŧ" ];
    U = [ "Ù" "Ú" "Û" "Ü" "Ũ" "Ū" "Ŭ" "Ů" "Ű" "Ų" ];
    u = [ "ù" "ú" "û" "ü" "ũ" "ū" "ŭ" "ů" "ű" "ų" ];
    W = [ "Ŵ" ];
    w = [ "ŵ" ];
    Y = [ "Ý" "Ŷ" "Ÿ" ];
    y = [ "ý" "ÿ" "ŷ" ];
    Z = [ "Ź" "Ż" "Ž" ];
    z = [ "ź" "ż" "ž" ];

    AE = [ "Æ" ];
    ae = [ "æ" ];
    TH = [ "Þ" ];
    th = [ "þ" ];
    ss = [ "ß" ];
    IJ = [ "Ĳ" ];
    ij = [ "ĳ" ];
    OE = [ "Œ" ];
    oe = [ "œ" ];

    "'n" = [ "ŉ" ];
  };
  o = flatten (attrValues i);
  r = flatten (mapAttrsToList (n: v: genList (const n) (length v)) i);
in replaceStrings o r s
