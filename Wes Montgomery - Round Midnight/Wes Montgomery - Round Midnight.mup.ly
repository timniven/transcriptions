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
    % ees minor
    % pass
    % ges Maj6 / des -> this sus chord feels wrong, lacking color, root-4-maj7-2 does work? 
    c min7 flat 5
    % aes min 7 (likely)
    % that des one, still unclear
    c min7 flat 5
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
  \key ees \minor
  \time 4/4
  r4 \grace {a,\6\glissando} \tuplet 3/2 { bes,8\6 ees8\5 f16 bes16 } ges8 \grace {des'\3\glissando} ees'4\3
  aes32\4( a32\4 aes32\4) ges32\4 ees16\5 ees4\5
  ees16\5 d16\5 ees16\5 \grace {a\4\glissando} bes8\4 aes16\4( ges16\4) aes8\4 
  \tuplet 3/2 {ges16\4( f16\4) ees16\5} f16\4( ges16\4) f8\4
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
