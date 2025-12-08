live_loop :kick do
  sample :bd_tek, amp: 2
  sleep 0.5
end
live_loop :snare do
  sleep 1
  sample :sn_generic, amp: 1.2
  sleep 1
end
live_loop :hihat do
  sleep 0.25
  sample :drum_cymbal_closed, amp: 0.7, rate: 1.5
  sleep 0.25
end
live_loop :bass do
  use_synth :tb303
  play :e2, release: 0.3, cutoff: 80 ,  amp: 1.5
  sleep 0.5
  play :e2, release: 0.3, cutoff: 70 , amp: 1.3
  sleep 0.5
end
live_loop :guitar do
  use_synth :pluck
  play_chord [:e3, :g3, :b3], release: 1.5, amp: 0.8
  sleep 2
end
live_loop :sax do
  use_synth :fm
  play_pattern_timed [:g4, :a4, :b4, :d5, :b4, :a4], [0.5, 0.5, 0.5, 0.75, 0.25, 1], amp: 0.75
  sleep 1
end
