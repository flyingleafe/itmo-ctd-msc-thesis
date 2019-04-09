with import <nixpkgs> {}; {
  thesisTextEnv = stdenv.mkDerivation {
    name = "thesis-text-env";
    src = ./.;
    buildInputs = [
      (texlive.combine {
        inherit (texlive)
          collection-basic
          collection-fontsrecommended
          collection-langcyrillic
          collection-xetex

          algorithms
          algorithmicx
          appendixnumberbeamer
          biber
          biblatex
          biblatex-gost
          caption
          chngcntr
          cm-super
          csquotes
          enumitem
          extsizes
          filecontents
          floatrow
          fontspec
          lastpage
          listings
          logreq
          paratype
          pgf
          scheme-basic
          setspace
          subfigure
          tabu
          totcount
          titlesec
          ulem
          varwidth
          was
          xstring;
      })
      pdftk
      ghostscript
      biber
      graphviz
    ];
  };
}
