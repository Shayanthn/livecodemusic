live_loop :bass_riff do
  with_transpose shifting do
    use_synth :fm
    notes = (ring :E3, :E3, :G3, :E3, :D3, :C3, :B2)
    times = (ring 1.5, 0.5, 0.75, 0.75, 0.5, 1, 1)
    
    with_fx :distortion, distort: 0.3 do
      play notes.tick, release: 0.8, amp: v_bass, cutoff: 90
      sleep times.look
    end
  end
end
live_loop :high_layer, sync: :bass_riff do
use_bpm 124
shifting = 5
v_bass = 1.5
v_drums = 1.2
live_loop :bass_riff do
  with_transpose shifting do
    use_synth :fm
    notes = (ring :E3, :E3, :G3, :E3, :D3, :C3, :B2)
    times = (ring 1.5, 0.5, 0.75, 0.75, 0.5, 1, 1)
    with_fx :distortion, distort: 0.3 do
      play notes.tick, release: 0.8, amp: v_bass, cutoff: 90
      sleep times.look
    end
  end
end
live_loop :high_layer, sync: :bass_riff do
  if shifting > 0
    with_transpose shifting + 12 do
      use_synth :prophet
      play (ring :E3, :E3, :G3, :E3, :D3, :C3, :B2).tick, release: 0.5, amp: 0.5, cutoff: 100
      sleep (ring 1.5, 0.5, 0.75, 0.75, 0.5, 1, 1).look
    end
  else
    stop
  end
end
live_loop :drums do
  sample :drum_heavy_kick, amp: v_drums
  sample :drum_tom_lo_hard, amp: v_drums if spread(1,4).tick
  sleep 1
  sample :drum_snare_hard, amp: v_drums
  sleep 1
end