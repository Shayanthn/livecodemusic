# ============================================================
# He's a Pirate (Pirates of the Caribbean) – Full Arrangement
# By Shayan Taherkhani | YT: Shayan Tech Hub
# ============================================================
use_bpm 100          # dotted quarter = beat (12/8 feel)

# ---- Master: one-time start signal ----
live_loop :conductor do
  sleep 1
  cue :curtains_open
  stop
end

# ---- Lead Melody (iconic theme) ----
live_loop :lead do
  sync :curtains_open
  use_synth :blade       # epic string/brass lead
  with_fx :reverb, room: 0.9, mix: 0.5 do
    # --- Intro build (silent for 4 bars) ---
    sleep 4 * 4          # 4 dotted quarters per bar × 4 bars
    
    # --- A section (riff 2x) ---
    2.times do
      play :d4, release: 0.3; sleep 0.333
      play :d4, release: 0.3; sleep 0.333
      play :d4, release: 0.3; sleep 0.333
      play :d4, release: 0.3; sleep 0.333
      play :d4, release: 0.3; sleep 0.333
      play :d4, release: 0.3; sleep 0.333
      play :d4, release: 0.3; sleep 0.333
      play :e4, release: 0.3; sleep 0.333
      play :f4, release: 0.3; sleep 0.333
      play :e4, release: 0.3; sleep 0.333
      play :f4, release: 0.3; sleep 0.333
      play :g4, release: 0.5; sleep 0.667
      play :f4, release: 0.3; sleep 0.333
      play :e4, release: 0.3; sleep 0.333
      play :d4, release: 0.3; sleep 0.333
      play :c4, release: 0.3; sleep 0.333
      play :d4, release: 1.0; sleep 1.333
      sleep 0.667           # gap
    end
    
    # --- B section (mellow, rising) ---
    play :a4, release: 0.7; sleep 1.0
    play :g4, release: 0.7; sleep 1.0
    play :f4, release: 0.7; sleep 1.0
    play :e4, release: 0.7; sleep 1.0
    play :d4, release: 0.7; sleep 1.0
    play :c4, release: 0.7; sleep 1.0
    play :d4, release: 1.2; sleep 2.0
    
    # --- Transition (rapid run) ---
    play_pattern_timed [:d4, :e4, :f4, :g4, :a4, :bb4, :a4, :g4],
      [0.333, 0.333, 0.333, 0.333, 0.333, 0.333, 0.333, 0.667],
      amp: 1.2
    play :a4, release: 1.5; sleep 2.0
    
    # --- Grand finale (full melody with variation) ---
    play :d5, release: 0.3; sleep 0.333
    play :d5, release: 0.3; sleep 0.333
    play :d5, release: 0.3; sleep 0.333
    play :e5, release: 0.3; sleep 0.333
    play :f5, release: 0.3; sleep 0.333
    play :e5, release: 0.3; sleep 0.333
    play :f5, release: 0.3; sleep 0.333
    play :g5, release: 0.5; sleep 0.667
    play :f5, release: 0.3; sleep 0.333
    play :e5, release: 0.3; sleep 0.333
    play :d5, release: 0.3; sleep 0.333
    play :c5, release: 0.3; sleep 0.333
    play :d5, release: 2.0; sleep 2.0
    
    stop
  end
end

# ---- Strings (harmony & countermelody) ----
live_loop :strings do
  sync :curtains_open
  use_synth :hollow
  with_fx :reverb, room: 0.8, mix: 0.4 do
    # intro soft pad
    4.times do
      play chord(:d3, :minor), attack: 0.5, release: 3, amp: 0.5, cutoff: 80
      sleep 4
    end
    
    # A section chords
    2.times do
      play chord(:d3, :minor), attack: 0.3, release: 3, amp: 0.5
      sleep 4
      play chord(:c3, :major), attack: 0.3, release: 3, amp: 0.5
      sleep 4
    end
    
    # B section softer chords
    play chord(:bb2, :major), attack: 0.5, release: 3, amp: 0.4; sleep 4
    play chord(:a2, :minor), attack: 0.5, release: 3, amp: 0.4; sleep 4
    play chord(:g2, :minor), attack: 0.5, release: 3, amp: 0.4; sleep 4
    
    # transition build
    play chord(:d3, :minor), attack: 0.3, release: 4, amp: 0.6
    sleep 4
    
    # finale
    play chord(:d3, :minor), attack: 0.3, release: 6, amp: 0.7
    sleep 6
    stop
  end
end

# ---- Brass (punctuation & hits) ----
live_loop :brass do
  sync :curtains_open
  use_synth :prophet
  with_fx :reverb, room: 0.6, mix: 0.3 do
    # intro stabs (every 2 bars)
    2.times do
      sleep 8
      play chord(:d3, :minor), release: 0.3, amp: 0.8, cutoff: 100
      sleep 0.2
    end
    
    # A section - accent on the high notes
    2.times do
      sleep 3.5
      play :a4, release: 0.2, amp: 1.0; sleep 0.5
      play :g4, release: 0.2, amp: 1.0; sleep 0.5
      sleep 3.5
    end
    
    # B section silence
    sleep 12
    
    # transition crescendo
    play chord(:d4, :minor), release: 0.5, amp: 0.9
    sleep 4
    
    # finale loud hit
    play chord(:d4, :minor), release: 0.8, amp: 1.2
    sleep 2
    stop
  end
end

# ---- Bass line (deep & powerful) ----
live_loop :bassline do
  sync :curtains_open
  use_synth :fm
  with_fx :lpf, cutoff: 80 do
    # intro silent
    sleep 16
    
    # A section bass pattern
    2.times do
      play :d2, release: 1.0; sleep 1.0
      play :d2, release: 0.5; sleep 0.667
      play :c2, release: 0.5; sleep 1.0
      play :d2, release: 0.8; sleep 0.667
      play :d2, release: 0.5; sleep 0.667
      play :c2, release: 0.5; sleep 1.0
      play :d2, release: 1.0; sleep 2.0
      play :c2, release: 1.0; sleep 2.0
    end
    
    # B section
    play :bb1, release: 1.5; sleep 2
    play :a1, release: 1.5; sleep 2
    play :g1, release: 1.5; sleep 4
    play :d2, release: 1.5; sleep 4
    
    # finale
    play :d2, release: 2.0; sleep 2
    play :d2, release: 2.0; sleep 4
    stop
  end
end

# ---- Percussion (energetic drive) ----
live_loop :drums do
  sync :curtains_open
  # intro: just a roll then cymbal
  in_thread do
    sleep 3.8
    sample :drum_roll, amp: 1.5, rate: 0.8
    sleep 0.2
    sample :drum_cymbal_open, amp: 0.7, attack: 0.05, sustain: 0.3, release: 0.5
  end
  
  # main pattern (from bar 5)
  sleep 16  # skip intro
  8.times do   # 32 beats of main groove
    sample :bd_haus, amp: 1.5
    sleep 0.667
    sample :drum_snare_soft, amp: 0.8, rate: 1.2
    sleep 0.333
    sample :bd_haus, amp: 1.0
    sleep 0.667
    sample :drum_snare_soft, amp: 0.8, rate: 1.2
    sleep 0.333
  end
  
  # transition roll & crash
  sample :drum_roll, amp: 1.3, rate: 0.9
  sleep 2
  sample :drum_cymbal_open, amp: 1.0, sustain: 0.5
  
  # final hits
  sleep 2
  3.times do
    sample :bd_haus, amp: 1.8
    sleep 0.667
  end
  sleep 0.5
  sample :drum_cymbal_open, amp: 0.9, sustain: 2
  stop
end