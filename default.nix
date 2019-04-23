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
          collection-langgerman
          collection-xetex

          algorithms
          algorithmicx
          appendixnumberbeamer
          beamer
          biber
          biblatex
          biblatex-gost
          booktabs
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
          titlesec
          totcount
          translator
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
