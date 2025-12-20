# Moonlight sonata beethoven
#coded by Shayan Taherkhani / ShayanTaherkhani.ir

use_bpm 44
use_debug false
use_random_seed 500

bass_on = 1
arpeggio_on = 1
melody_on = 1

define :human_delay do
  sleep rdist(0.007, 0)
end

define :expressive_piano do |nt, vol, sus = 1.0|
  bright = 70 + (vol * 40)
  play nt, amp: vol, sustain: sus * 0.9, release: 0.5, hard: vol * 0.3, cutoff: bright, noise_amp: 0.1
end

define :triplet_arp do |n1, n2, n3, base_vol|
  if arpeggio_on == 1
    expressive_piano n1, base_vol + 0.05
    human_delay
    sleep 0.333
    expressive_piano n2, base_vol * 0.8
    human_delay
    sleep 0.333
    expressive_piano n3, base_vol * 0.85
    human_delay
    sleep 0.334
  else
    sleep 1
  end
end

with_fx :reverb, room: 0.9, mix: 0.5, damp: 0.6 do
  with_fx :compressor, threshold: 0.2, slope_above: 0.5 do
    use_synth :piano
    
    live_loop :moonlight_concert do
      in_thread do
        if bass_on == 1
          play :cs2, amp: 0.5, sustain: 3.8, release: 0.5
          play :cs1, amp: 0.4, sustain: 3.8, release: 0.5
        end
      end
      4.times { triplet_arp :gs3, :cs4, :e4, 0.4 }
      
      in_thread do
        if bass_on == 1
          play :b1, amp: 0.45, sustain: 3.8
          play :b0, amp: 0.35, sustain: 3.8
        end
      end
      4.times { triplet_arp :gs3, :cs4, :e4, 0.38 }
      
      in_thread do
        if bass_on == 1
          play :a1, amp: 0.48; play :a0, amp: 0.38
        end
      end
      2.times { triplet_arp :a3, :cs4, :e4, 0.42 }
      
      in_thread do
        if bass_on == 1
          play :fs1, amp: 0.45; play :fs0, amp: 0.35
        end
      end
      2.times { triplet_arp :a3, :d4, :fs4, 0.42 }
      
      in_thread do
        if bass_on == 1
          play :gs1, amp: 0.55; play :gs0, amp: 0.45
        end
      end
      triplet_arp :gs3, :cs4, :fs4, 0.45
      triplet_arp :gs3, :cs4, :e4, 0.42
      triplet_arp :gs3, :bs3, :ds4, 0.38
      triplet_arp :fs3, :bs3, :ds4, 0.35
      
      in_thread do
        if bass_on == 1
          play :cs2, amp: 0.5; play :cs1, amp: 0.4
        end
      end
      in_thread { 4.times { triplet_arp :gs3, :cs4, :e4, 0.35 } }
      sleep 3
      expressive_piano :gs4, 0.7, 0.8 if melody_on == 1
      sleep 0.75
      expressive_piano :gs4, 0.5, 0.2 if melody_on == 1
      sleep 0.25
      
      in_thread do
        if bass_on == 1
          play :e2, amp: 0.55; play :e1, amp: 0.45
        end
      end
      in_thread { 4.times { triplet_arp :gs3, :e4, :gs4, 0.4 } }
      expressive_piano :gs4, 0.85, 1.5 if melody_on == 1
      sleep 1.5
      expressive_piano :gs4, 0.65, 0.5 if melody_on == 1
      sleep 0.5
      expressive_piano :gs4, 0.85, 1.5 if melody_on == 1
      sleep 1.5
      expressive_piano :gs4, 0.65, 0.5 if melody_on == 1
      sleep 0.5
    end
  end
end

