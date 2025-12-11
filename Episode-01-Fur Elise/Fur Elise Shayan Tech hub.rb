#fur elise by Shayan Tech hub :
use_bpm 90

set :drum_amp, 0

define :fur_elise_a do |round_num|
  if round_num >= 1
    set :drum_amp, 1.5
  end
  
  use_synth :pluck
  use_synth_defaults release: 2, amp: 1.2, coef: 0.5
  
  2.times do
    play_pattern_timed [:e5, :ds5, :e5, :ds5, :e5, :b4, :d5, :c5, :a4], [0.25]
    sleep 0.25
    
    play :c4, release: 3; sleep 0.25
    play :e4; sleep 0.25
    play :a4; sleep 0.25
    play :b4, release: 3; sleep 0.5
    
    play :e4; sleep 0.25
    play :gs4; sleep 0.25
    play :b4; sleep 0.25
    play :c5, release: 3; sleep 0.5
    
    play :e4; sleep 0.25
    play :e5; sleep 0.25
    play :ds5; sleep 0.25
    play :e5; sleep 0.25
    play :ds5; sleep 0.25
    play :e5; sleep 0.25
    play :b4; sleep 0.25
    play :d5; sleep 0.25
    play :c5; sleep 0.25
    play :a4, release: 4; sleep 1
  end
end

define :drum_pattern do
  vol = get[:drum_amp]
  
  sample :bd_fat, amp: 2 * vol, rate: 0.9
  sleep 0.5
  sample :drum_cymbal_closed, amp: 0.5 * vol
  sleep 0.5
  
  sample :sn_dolf, amp: 1.5 * vol
  sleep 0.25
  sample :drum_cymbal_pedal, amp: 0.3 * vol
  sleep 0.25
  sample :bd_fat, amp: 1.2 * vol
  sleep 0.5
  
  sample :drum_cymbal_closed, amp: 0.5 * vol
  sleep 0.5
  sample :bd_fat, amp: 1.5 * vol
  sleep 0.5
  
  sample :sn_dolf, amp: 1.5 * vol
  sleep 0.25
  sample :bd_fat, amp: 0.8 * vol
  sleep 0.25
  sample :drum_cymbal_open, amp: 0.4 * vol, sustain: 0.1
  sleep 0.5
end

with_fx :reverb, room: 0.8, mix: 0.6 do
  with_fx :lpf, cutoff: 90 do
    
    live_loop :melody do
      round_number = tick
      fur_elise_a round_number
      sleep 2
    end
    
    live_loop :chords do
      sync :melody
      use_synth :fm
      use_synth_defaults attack: 0.1, release: 4, depth: 1, amp: 0.7
      
      6.times do
        play_chord [:a2, :e3, :c4], release: 4
        sleep 1.5
        play_chord [:e3, :a3, :c4], release: 3
        sleep 1.5
      end
    end
    
    live_loop :heavy_drums do
      sync :melody
      vol = get[:drum_amp]
      
      4.times do
        drum_pattern
      end
      
      sample :bd_fat, amp: 2 * vol, rate: 0.9
      sleep 0.5
      sample :drum_cymbal_closed, amp: 0.5 * vol
      sleep 0.5
      
      sample :sn_dolf, amp: 1.5 * vol
      sleep 0.25
      sample :drum_cymbal_pedal, amp: 0.3 * vol
      sleep 0.25
      sample :bd_fat, amp: 1.2 * vol
      sleep 0.5
    end
    
  end
end
