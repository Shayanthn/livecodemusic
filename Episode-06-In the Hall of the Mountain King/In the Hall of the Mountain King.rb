set :current_bpm, 100
use_synth :piano

live_loop :mountain_king_main do
  bpm = get[:current_bpm]
  use_bpm bpm
  cue :tick_main
  
  off = (bpm > 160 ? 12 : 0)
  off = (bpm > 240 ? 24 : off)
  
  with_fx :reverb, room: 0.8 do
    with_fx :echo, phase: 0.25, mix: (bpm / 500.0) do
      
      [:b2, :cs3, :d3, :e3, :fs3, :d3].each do |n|
        play n + off, release: 0.2, amp: 0.8
        sleep 0.5
      end
      play :fs3 + off, sustain: 0.5, release: 0.5
      sleep 1.0
      
      play :f3 + off, release: 0.2
      sleep 0.5; play :cs3 + off, release: 0.2
      sleep 0.5; play :f3 + off, sustain: 0.5, release: 0.5
      sleep 1.0; play :e3 + off, release: 0.2
      sleep 0.5; play :c3 + off, release: 0.2
      sleep 0.5; play :e3 + off, sustain: 0.5, release: 0.5
      sleep 1.0
      
      [:b2, :cs3, :d3, :e3, :fs3, :d3, :b3, :fs3].each do |n|
        play n + off, release: 0.2
        sleep 0.5
      end
      
      play :d4 + off, release: 0.2
      sleep 0.5; play :b3 + off, release: 0.2
      sleep 0.5; play :fs3 + off, sustain: 0.5, release: 0.5
      sleep 1.0; play :d4 + off, release: 0.2
      sleep 0.5; play :as3 + off, release: 0.2
      sleep 0.5; play :fs3 + off, sustain: 0.5, release: 0.5
      sleep 1.0
      
      [:d4, :b3, :fs3, :d3].each do |n|
        play n + off, release: 0.2
        sleep 0.5
      end
      play :b2 + off, sustain: 1, release: 1
      sleep 1.0
      
      if bpm > 220
        sample :drum_cymbal_hard, amp: 1.5, sustain: 2
      end
      
      if bpm < 350
        set :current_bpm, bpm + 20
      else
        sample :sn_reverb, amp: 3
        set :current_bpm, 100
        sleep 4
      end
      sleep 1.0
    end
  end
end

live_loop :mountain_king_bass do
  sync :tick_main
  bpm = get[:current_bpm]
  use_bpm bpm
  
  8.times do
    sample :bd_haus, amp: 2, cutoff: 70
    use_synth :subpulse
    play :b1, amp: 1.5, release: 0.4 if factor?(tick, 4)
    sleep 2
  end
end

live_loop :mountain_vibe do
  sync :tick_main
  bpm = get[:current_bpm]
  use_bpm bpm
  
  use_synth :dark_ambience
  with_fx :reverb, room: 1, mix: 0.5 do
    play :b1, sustain: 16, amp: (bpm / 250.0), release: 2
    sleep 16
  end
end