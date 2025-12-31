# Coded by Shayan Taherkhani YT : SHAYAN TECH HUB
# Bella Ciao Techno
use_bpm 128

set :kick_on, 1
set :hats_on, 1
set :bass_on, 1
set :lead_on, 1
set :key_shift, 0

live_loop :kick_drum do
  if get(:kick_on) == 1
    sample :bd_haus, amp: 2.5, cutoff: 120
  end
  sleep 1
end

live_loop :hihats do
  if get(:hats_on) == 1
    sleep 0.5
    sample :elec_cymbal, amp: 0.6, attack: 0, release: 0.08, cutoff: 130
    sleep 0.5
  else
    sleep 1
  end
end

live_loop :sub_bass do
  if get(:bass_on) == 1
    use_synth :fm
    k = get(:key_shift)
    sleep 0.5
    3.times do
      play :d2 + k, release: 0.25, amp: 0.7, cutoff: 90
      sleep 0.25
    end
  else
    sleep 1
  end
end

live_loop :main_melody do
  if get(:lead_on) == 1
    use_synth :saw
    k = get(:key_shift)
    c = line(80, 120, steps: 16).tick(:filter)
    
    with_fx :reverb, room: 0.7, mix: 0.4 do
      with_fx :compressor, amp: 1.3 do
        
        2.times do
          play_pattern_timed [:a3, :d4, :e4, :f4].map{|n| note(n)+k}, [0.5, 0.5, 0.5, 0.5]
          play :d4 + k, release: 0.6, cutoff: c; sleep 1.5
          sleep 0.5
        end
        
        play_pattern_timed [:a3, :d4, :e4, :f4, :e4, :d4, :f4, :e4, :d4].map{|n| note(n)+k}, [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5], cutoff: c
        
        sleep 0.25
        4.times do
          play :a4 + k, release: 0.1, cutoff: 130, amp: 1.5
          sleep 0.25
        end
        play :a4 + k, release: 0.5, cutoff: 130; sleep 0.75
        
        play_pattern_timed [:a4, :g4, :a4, :bb4].map{|n| note(n)+k}, [0.5, 0.5, 0.5, 0.5], cutoff: c
        play :bb4 + k; sleep 1
        
        play_pattern_timed [:bb4, :a4, :g4, :bb4].map{|n| note(n)+k}, [0.5, 0.5, 0.5, 0.5], cutoff: c
        play :a4 + k; sleep 1
        
        play_pattern_timed [:a4, :g4, :f4, :e4].map{|n| note(n)+k}, [0.5, 0.5, 0.5, 0.5], cutoff: c
        play :d4 + k, release: 2; sleep 2
      end
    end
  else
    sleep 1
  end
end