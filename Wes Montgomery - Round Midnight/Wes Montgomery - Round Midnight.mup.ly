\version "2.24.3"

% returning to some tutorials:
% - guitar notation: https://lilypond.org/doc/v2.24/Documentation/notation/guitar
% - extended and altered chords: https://lilypond.org/doc/v2.24/Documentation/notation/chord-mode#extended-and-altered-chords
% - printing chord names: https://lilypond.org/doc/v2.24/Documentation/notation/displaying-chords#printing-chord-names
% - grace notes: 
% - glissando: 

% chord indicators
chords = {
  \chordmode {
    e,
  }
}

bass = {
  \time 4/4
  ees d des2
  c2 aes,4 des4
  c2 
}

guitar = {
  \key ees \minor
  \time 4/4
  r4 \grace {a,\6\glissando} \tuplet 3/2 { bes,8\6 ees8\5 f16 bes16 } ges8 \grace {des'\3\glissando} ees'4\3
  aes32\4( a32\4 aes32\4) ges32\4 ees8\5 ees4\5
}

\header{
  title = "Round Midnight"
  composer = "Wes Montgomery"
}

\score {
  \new StaffGroup <<
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
      \override Glissando.minimum-length = 2
      \override Glissando.springs-and-rods =
                          #ly:spanner::set-spacing-rods
      \omit StringNumber
    }    
  }  
}
