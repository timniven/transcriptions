\version "2.24.3"

% returning to some tutorials:
% - guitar notation: https://lilypond.org/doc/v2.24/Documentation/notation/guitar
% - extended and altered chords: https://lilypond.org/doc/v2.24/Documentation/notation/chord-mode#extended-and-altered-chords
% - printing chord names: https://lilypond.org/doc/v2.24/Documentation/notation/displaying-chords#printing-chord-names
% - grace notes: 
% - glissando: 

% chord indicators
% chord name chart: https://lilypond.org/doc/v2.24/Documentation/notation/chord-name-chart
% I wonder whether there is a char you can use for the 
chordss = \new ChordNames {
  \chordmode {
    ees2:min7    
    des2:9
    c2:min7.5-
    aes4:min7
    des4:9
    c1:min7.5-
    b4:min7
    e4:9
    bes4:min7
    ees4:9
    aes2:min7
    des2:9
    ges4:7
    g4:7
    aes2:7
    c2:min7.5-
    b2:7.9-
    bes1:7
  }
}

bass = {
  \time 4/4
  ees4 d4 des2
  c2 aes,4 des4
  c1
  b,4 e4 aes,4 ees4 
  aes,2 des4 g,4 
  ges,4 g,4 aes,2
  c2 b,2
  bes,1
}

guitar = {
  \tempo "" 4 = 50
  \key ees \minor
  \time 4/4
  r4 \grace {a,\6\glissando} \tuplet 3/2 { bes,8\6 ees8\5 f16 bes16 } ges8 \grace {des'\3\glissando} ees'4\3
  aes32\4( a32\4 aes32\4) ges32\4 ees16\5 ees4\5
  ees16\5 d16\5 ees16\5 \grace {a\4\glissando} bes8\4 aes16\4( ges16\4) aes8\4 
  \tuplet 3/2 {ges16\4( f16\4) ees16\5} f16\4( ges16\4) f8\4
  bes,32\6 ees32\5 ges32\4 bes32\3 des'32\3 bes32\3 b32\3 c'4\3~ c'8\3
  ges16\4 g16\4   aes16\4 \tuplet 3/2 {a8\4   d'8\3  e'32\2\glissando   } ges'32\2 aes16\4
  f16\4   ges16\4 g16\4   \tuplet 3/2 {aes8\4 des'8\3 ees'32\2\glissando} f'32\2 g8\4 
}

\header{
  title = "Round Midnight"
  composer = "Wes Montgomery"
}

\score {
  \new StaffGroup <<
    \chords { \chordss }
    \new Staff \with {
      instrumentName = "Guitar"
    } {
      \clef "treble_8"
      \guitar
    }
    \new TabStaff {
      \guitar
    }
    \new Staff \with {
      instrumentName = "Bass"
    } {
      \clef "bass"
      \bass
    }
  >>
  \layout {
    \context {
      \Score
      \override Glissando.minimum-length = 3
      \override Glissando.springs-and-rods =
                          #ly:spanner::set-spacing-rods
      \omit StringNumber
    }    
  }  
}
