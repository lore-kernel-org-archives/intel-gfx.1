Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343D660A2626
	for <intel-gfx@archiver.kernel.org>; Mon,  2 Nov 2026 12:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bp+TLhnT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A5B10EDB6;
	Mon,  2 Nov 2026 12:42:52 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4BC10E047
 for <intel-gfx@lists.freedesktop.org>; Sat, 31 Oct 2026 19:34:39 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a20bde60a0so13738175e9.3
 for <intel-gfx@lists.freedesktop.org>; Sat, 31 Oct 2026 12:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793475277; x=1794080077; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=WTeQ9BaGJRCMyKLIH6hVwocx7w+r9ln3q/DJI6KeoLA=;
 b=Bp+TLhnTMrb6eRnO466sdfqsyMEEFFCBXz0W2Yzs92jb9TbMX9p7cXDnU/Kclg5Qzz
 kQmrvwbVeuL8OBc3unGKTKwL6Z24okPn7H4xc86T4OGoquoS6vzEc7+Sne+mQpygqDh4
 JSp3pHewEE8mERcW+bU9huOv12tBMHC5RlwwBSIJTKFk6/UOu4b/mCV8XTYQbz6bxKrt
 0cfbxpxzxqEpYWaz03pPi8/txFasQJESESevy+di8EgsAO+DG8dG0i/1uf2cb7mjzZQJ
 ysD6jPwcZdvAZfGt4rxQtSI0Qz5p6F2vzX+4ZOyNQQ7j+YT5W4YWCWQT+02fsnCCrkF+
 WbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793475277; x=1794080077;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WTeQ9BaGJRCMyKLIH6hVwocx7w+r9ln3q/DJI6KeoLA=;
 b=qA7U4SVap769nmuXSuGI/egvNhvzMt1hO0fndEPfZ5YrDiyeGoy93XQp7CCwL3SDOy
 gXfrKuKRufe/pW6jGuu6DSKotUIVnjxpVIZ7rrwvdCP1BNJXiCXy/ZByBmdSxsBSNoRG
 mpIWccGTlU86WutE8/6FdURvcJApr1zPlpfMO/Pwglrl27VCrUenxLiY9r+HiM2KLYbK
 33I5R5NdOLNHNGLN7FTkBAjpwg1XkAu9uNkEFZFMAtD0FDSxWn+ILuLIX5nD0qGqJ9OM
 oRtAQ3ybvjmlmONrUti1Oafu0KkTRIomcpnvrILamxAcFOuXoUl3KUBBo2xX13F3m6XS
 xqUw==
X-Forwarded-Encrypted: i=1;
 AKwUvByiELykBXskq4UGywa9Q9MbDqxjigsWnJHDFXXjjOk+HkolvCqGrz09I26wtAaC1aEylBn4frjtDN8=@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLyhiq4xKFDH3K88+6MuLxlREGq+o9TorM1nRmawpbhiQDgmkgj
 3JCFHeih5koVIwlm4ZDIr8whMBVe3Vl3t1qEMc5R4Q5Eq9wwrMbRmrRY
X-Gm-Gg: AYBFou1jUIF2BPJN/gDyhGa0kB7LNVTxqnHCSMxn/LoHvGMkgWK+W0aie8PYDADzgF0
 W8nVbrSYrNe7FTMWUFOFIIOO2Swq7ayjL9eenJYkMqfY5PlsKiKfRZlZiFgNCwsT0TV1yI0cPtb
 P4inkYEFIICtAPMFAP/CopHnXVzif386t0lhVtVTO3a706vD7mG7o/tubz3E4+LKeWTvo5jMWQG
 UUu8fEUiGQ1VPXFNEcVcdty0Y7TvuFNaN/PG9e+w+rhyp5lK8lKB1PBhZGLjsX0qcrQC7YxihXv
 8CSN+d0xxOiLn+dHBltBn8joTf7aKhEUQj6HFeG7bhqx6uJWv+NQC6Py4Imry85dPJQny6GXSyQ
 mOyj0PC81of1GmcQKiRUTAyjykU3SUhof4mxGj+ROHQ4s0Ca2x8F8CF/jUvy5wgU4UvD7aquE+s
 fi+E23GajFQSkYU5iPFp4rB+PH/nl/K6XEb8lpdjjEvTPOEYZI7CFpCXwJytKqtv2TdpG5/csyy
 +YDTEu81XSYoaTF2+LTj+Rq/JswdsmwVOZdwRdxpOIOiwVtn3E5otJmM/yOBq76onPJsaxVa2U+
 x6tDblfZc0+US8Jw3MG8k1MV8CYiMTfafH2BQ9+9ujkGoCB+7Z67L7HzYNZNDwa6DHLX+bpGStC
 iQQB5FLAHCwwQSN3gFajO+/hYkg==
X-Received: by 2002:a05:600c:6211:b0:4a1:80d8:aed5 with SMTP id
 5b1f17b1804b1-4ac17191046mr144883115e9.6.1793475276952; 
 Sat, 31 Oct 2026 12:34:36 -0700 (PDT)
Received: from archlinux.fritz.box ([178.197.200.54])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e77409821sm6276363f8f.0.2026.10.31.12.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 12:34:36 -0700 (PDT)
From: Tobias Predel <tobias.predel@gmail.com>
To: linux-sound@vger.kernel.org,
	intel-gfx@lists.freedesktop.org
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [BUG] ALSA: hda/intel-hdmi: silent stream verbs time out in i915
 hibernation restore, ~35 s resume delay with DP monitor
Date: Sat, 31 Oct 2026 20:34:33 +0100
Message-ID: <20261031193433.6981-1-tobias.predel@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 02 Nov 2026 12:42:45 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,LOTS_OF_MONEY,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

When resuming from hibernation (S4) with an external DisplayPort monitor
that has audio connected, the i915 restore callback takes 35-37 seconds.
Function-graph tracing shows the time is spent in the Intel HDMI codec's
silent stream setup, called synchronously from the i915 modeset in
intel_audio_codec_enable(). Every HDA verb there runs into the 1 s
snd_hdac_bus_get_response() timeout, apparently because the HDA
controller (SOF, sof-audio-pci-intel-tgl) has not been restored yet when
i915 restores the display.

Booting with snd_hda_codec_intelhdmi.enable_silent_stream=N removes the
delay completely (i915 pci_pm_restore 37.2 s -> 0.15 s, same setup).

Hardware / software
-------------------
- HP Dragonfly 13.5 inch G4, BIOS V90 01.13.01 (07/08/2026)
- Intel Core i7-1355U (Raptor Lake-P), Iris Xe (i915)
- Audio: SOF (sof-audio-pci-intel-tgl, firmware 2:2:0-57864,
  topology sof-hda-generic-2ch.tplg), codecs Realtek ALC245
  (0x10ec0245) and Intel Raptor Lake P HDMI (0x8086281f)
- External monitor Philips 499P9 (DP audio sink) on DP-3 via a USB-C
  dock, internal eDP panel also enabled
- Kernel 7.2.11-arch1-1 (Arch Linux), sof-firmware 2026.09.2,
  linux-firmware 20260916
- Hibernation to swap file, HibernateMode=shutdown, i915 loaded in the
  initramfs (so the boot kernel also drives the display before the
  image is restored)

Reproduce
---------
1. Connect an external DP monitor with audio (here via a USB-C dock).
2. echo 1 > /sys/power/pm_print_times
3. systemctl hibernate, then power on and resume.
4. dmesg shows:

   i915 0000:00:02.0: PM: pci_pm_restore returned 0 after 37218199 usecs
   PM: restore of devices complete after 37332.666 msecs

   During that time the log is silent. Undocked (eDP only) the same
   restore takes ~0.37 s. Reproduced in 4 docked runs (35.2, 37.2, 37.2 and
   35.2 s).

Function graph trace
--------------------
Traced with set_graph_function=i915_pm_restore, tracing_thresh=100000
(only calls > 100 ms are recorded). Outer frames:

  i915_pm_restore                                 35210108 us
   i915_drm_resume                                35210106 us
    intel_display_driver_resume                   35180739 us
     __intel_display_driver_resume                35180587 us
      drm_atomic_helper_commit_duplicated_state   35179346 us
       drm_atomic_commit / intel_atomic_commit    35178967 us
        intel_atomic_commit_tail                  35178583 us
         intel_audio_codec_enable                 35072636 us
          intel_pin_eld_notify                    35058094 us
           snd_hda_hdmi_check_presence_and_report 35058092 us
            hdmi_present_sense                    35058089 us
             i915_set_silent_stream               28046897 us
              silent_stream_enable_i915           26043572 us
               snd_hda_hdmi_setup_audio_infoframe 22037032 us
                hdmi_pin_setup_infoframe          17028844 us
              silent_stream_set_kae                2003323 us
             i915_pin_cvt_fixup                    5008097 us
             haswell_verify_D0                     2003183 us
             snd_hda_codec_setup_stream            2003042 us

All leaf entries are snd_hdac_bus_get_response() taking ~1001 ms each,
35 in total (e.g. via codec_exec_verb, snd_hda_set_dev_select,
snd_hdac_check_power_state, hdmi_set_channel_count). In the PM log the
SOF controller's own restore completes later:

  sof-audio-pci-intel-tgl 0000:00:1f.3: PM: pci_pm_restore returned 0
  after 111423 usecs

With enable_silent_stream=N the trace shows no audio calls over 100 ms
and i915_pm_restore finishes in 145 ms.

Restore ordering (pm_print_times, attached run)
-----------------------------------------------
The SOF controller's restore is only called after i915's restore has
returned, so the HDMI codec is driven from i915's restore while its
controller is still suspended:

  [393.842119] i915 0000:00:02.0: PM: calling pci_pm_restore
  [429.058162] i915 0000:00:02.0: PM: pci_pm_restore returned 0 after 35217884 usecs
  [429.058191] sof-audio-pci-intel-tgl 0000:00:1f.3: PM: calling pci_pm_restore
  [429.470283] sof-audio-pci-intel-tgl 0000:00:1f.3: PM: pci_pm_restore returned 0 after 412096 usecs
  [429.470356] snd_hda_codec_intelhdmi ehdaudio0D2: PM: calling hda_codec_pm_restore

Logs
----
Appended at the end of this mail:
- the function_graph trace of the run above (set_graph_function=
  i915_pm_restore, tracing_thresh=100000, funcgraph-tail); it contains
  35 snd_hdac_bus_get_response() calls of ~1 s each
- the PM part of dmesg of the same run (pm_print_times=1, filtered to
  phase summaries, calls over 1 ms and the i915/SOF/HDMI codec restore
  calls). The full dmesg is available on request.

Notes
-----
- Changing enable_silent_stream at runtime has no effect; it is
  evaluated at codec probe, so a reboot (or codec rebind) is needed.
- I have not tested whether s2idle resume with the dock has the same
  problem.
- I assume the i915 audio notify needs to be deferred until the HDA
  controller is resumed, or the silent stream setup should be skipped
  or postponed while the codec/controller is still suspended, but I
  don't know the intended ordering between i915 and the HDA/SOF device
  across hibernation restore.

I can capture more traces or test patches on this machine.

Thanks,
Tobias Predel

--- function_graph trace (i915_pm_restore, threshold 100 ms) ---

# tracer: function_graph
#
# CPU  DURATION                  FUNCTION CALLS
# |     |   |                     |   |   |   |
  6) $ 1000291 us  |                                          } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1000343 us  |                                        } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1000348 us  |                                      } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1000349 us  |                                    } /* snd_hdac_exec_verb [snd_hda_core] */
  6) $ 1000351 us  |                                  } /* hda_reg_read [snd_hda_core] */
  6) $ 1000353 us  |                                } /* snd_hdac_regmap_read_raw_uncached [snd_hda_core] */
  6) $ 1000353 us  |                              } /* snd_hdac_read_parm_uncached [snd_hda_core] */
  6) $ 1000355 us  |                            } /* snd_hda_get_num_devices [snd_hda_codec] */
  6) $ 1000355 us  |                          } /* snd_hda_set_dev_select [snd_hda_codec] */
  6) $ 1001987 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1002018 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1002026 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1002027 us  |                                  } /* snd_hdac_exec_verb [snd_hda_core] */
  6) $ 1002031 us  |                                } /* hda_reg_write [snd_hda_core] */
  6) $ 1002042 us  |                              } /* _regmap_write */
  6) $ 1002045 us  |                            } /* regmap_write */
  6) $ 1002047 us  |                          } /* snd_hdac_regmap_write_raw [snd_hda_core] */
  6) $ 1001918 us  |                                    } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001951 us  |                                  } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001960 us  |                                } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001962 us  |                              } /* snd_hdac_check_power_state [snd_hda_core] */
  6) $ 1001782 us  |                                    } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001815 us  |                                  } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001824 us  |                                } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001825 us  |                              } /* snd_hdac_check_power_state [snd_hda_core] */
  6) $ 2003791 us  |                            } /* haswell_verify_D0 [snd_hda_codec_intelhdmi] */
  6) $ 1001902 us  |                                            } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001931 us  |                                          } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001937 us  |                                        } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001938 us  |                                      } /* snd_hdac_exec_verb [snd_hda_core] */
  6) $ 1001941 us  |                                    } /* hda_reg_read [snd_hda_core] */
  6) $ 1001943 us  |                                  } /* snd_hdac_regmap_read_raw_uncached [snd_hda_core] */
  6) $ 1001944 us  |                                } /* snd_hdac_read_parm_uncached [snd_hda_core] */
  6) $ 1001946 us  |                              } /* snd_hda_get_num_devices [snd_hda_codec] */
  6) $ 1001948 us  |                            } /* snd_hda_set_dev_select [snd_hda_codec] */
  6) $ 1001893 us  |                                  } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001924 us  |                                } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001931 us  |                              } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001933 us  |                            } /* snd_hdac_codec_read [snd_hda_core] */
  6) $ 1001987 us  |                                          } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1002019 us  |                                        } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1002028 us  |                                      } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1002029 us  |                                    } /* snd_hdac_exec_verb [snd_hda_core] */
  6) $ 1002033 us  |                                  } /* hda_reg_write [snd_hda_core] */
  6) $ 1002044 us  |                                } /* _regmap_write */
  6) $ 1002048 us  |                              } /* regmap_write */
  6) $ 1002051 us  |                            } /* snd_hdac_regmap_write_raw [snd_hda_core] */
  6) $ 5009734 us  |                          } /* i915_pin_cvt_fixup [snd_hda_codec_intelhdmi] */
  6) $ 1001733 us  |                                      } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001765 us  |                                    } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001773 us  |                                  } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001775 us  |                                } /* snd_hdac_codec_read [snd_hda_core] */
  6) $ 1001903 us  |                                      } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001932 us  |                                    } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001938 us  |                                  } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001939 us  |                                } /* snd_hdac_codec_write [snd_hda_core] */
  6) $ 2003720 us  |                              } /* snd_hda_codec_setup_stream [snd_hda_codec] */
  6) $ 1001684 us  |                                      } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001712 us  |                                    } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001717 us  |                                  } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001718 us  |                                } /* snd_hdac_codec_read [snd_hda_core] */
  5) $ 1001910 us  |                                      } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1001938 us  |                                    } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1001943 us  |                                  } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1001944 us  |                                } /* snd_hdac_codec_write [snd_hda_core] */
  5) $ 2003666 us  |                              } /* snd_hda_codec_setup_stream [snd_hda_codec] */
  5) $ 1001905 us  |                                                } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1001933 us  |                                              } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1001938 us  |                                            } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1001938 us  |                                          } /* snd_hdac_exec_verb [snd_hda_core] */
  5) $ 1001941 us  |                                        } /* hda_reg_read [snd_hda_core] */
  5) $ 1001943 us  |                                      } /* snd_hdac_regmap_read_raw_uncached [snd_hda_core] */
  5) $ 1001944 us  |                                    } /* snd_hdac_read_parm_uncached [snd_hda_core] */
  5) $ 1001945 us  |                                  } /* snd_hda_get_num_devices [snd_hda_codec] */
  5) $ 1001946 us  |                                } /* snd_hda_set_dev_select [snd_hda_codec] */
  5) $ 1001912 us  |                                      } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1001939 us  |                                    } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1001944 us  |                                  } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1001945 us  |                                } /* snd_hdac_codec_write [snd_hda_core] */
  5) $ 1001909 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1001936 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1001941 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1001943 us  |                                  } /* snd_hdac_codec_read [snd_hda_core] */
  6) $ 1001917 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001945 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001950 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001951 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  6) $ 2003895 us  |                                } /* hdmi_set_channel_count [snd_hda_core] */
  6) $ 1001906 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001934 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001939 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001940 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  6) $ 1001941 us  |                                } /* snd_hdac_setup_channel_mapping [snd_hda_core] */
  6) $ 1001910 us  |                                                  } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001937 us  |                                                } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001942 us  |                                              } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001943 us  |                                            } /* snd_hdac_exec_verb [snd_hda_core] */
  6) $ 1001945 us  |                                          } /* hda_reg_read [snd_hda_core] */
  6) $ 1001947 us  |                                        } /* snd_hdac_regmap_read_raw_uncached [snd_hda_core] */
  6) $ 1001949 us  |                                      } /* snd_hdac_read_parm_uncached [snd_hda_core] */
  6) $ 1001950 us  |                                    } /* snd_hda_get_num_devices [snd_hda_codec] */
  6) $ 1001951 us  |                                  } /* snd_hda_set_dev_select [snd_hda_codec] */
  6) $ 1001919 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001946 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001952 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001953 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  6) $ 1001900 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001927 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001932 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001933 us  |                                  } /* snd_hdac_codec_read [snd_hda_core] */
  6) $ 1001913 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001940 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001945 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001946 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  5) $ 1001912 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1001939 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1001944 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1001945 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  5) $ 1001916 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1001943 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1001948 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1001949 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  5) $ 1002078 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1002109 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1002119 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1002120 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  5) $ 1001734 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1001768 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1001779 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1001780 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  5) $ 1002068 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1002101 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1002110 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1002111 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  5) $ 1001846 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1001879 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1001889 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1001890 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  5) $ 1001922 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1001957 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1001968 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1001970 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  5) $ 1001765 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1001799 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1001810 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1001811 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  6) $ 1001903 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001932 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001939 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001940 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  6) $ 1001910 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001938 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001943 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001943 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  6) $ 1001921 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001949 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001954 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001954 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  6) $ 1001915 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001942 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001948 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001948 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  6) $ 1001915 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001942 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001947 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001948 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  6) $ 17033117 us |                                } /* hdmi_pin_setup_infoframe [snd_hda_codec_hdmi] */
  6) $ 22042853 us |                              } /* snd_hda_hdmi_setup_audio_infoframe [snd_hda_codec_hdmi] */
  6) $ 26050519 us |                            } /* silent_stream_enable_i915 [snd_hda_codec_intelhdmi] */
  6) $ 1001914 us  |                                    } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001941 us  |                                  } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001946 us  |                                } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001948 us  |                              } /* snd_hdac_codec_read [snd_hda_core] */
  5) $ 1001905 us  |                                    } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1001932 us  |                                  } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1001937 us  |                                } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1001938 us  |                              } /* snd_hdac_codec_write [snd_hda_core] */
  5) $ 2003888 us  |                            } /* silent_stream_set_kae [snd_hda_codec_intelhdmi] */
  5) $ 28054411 us |                          } /* i915_set_silent_stream [snd_hda_codec_intelhdmi] */
  5) $ 35066577 us |                        } /* hdmi_present_sense [snd_hda_codec_hdmi] */
  5) $ 35066580 us |                      } /* snd_hda_hdmi_check_presence_and_report [snd_hda_codec_hdmi] */
  5) $ 35066583 us |                    } /* intel_pin_eld_notify [snd_hda_codec_intelhdmi] */
  5) $ 35080698 us |                  } /* intel_audio_codec_enable [i915] */
  2) $ 35185919 us |                } /* intel_atomic_commit_tail [i915] */
  2) $ 35186337 us |              } /* intel_atomic_commit [i915] */
  2) $ 35186627 us |            } /* drm_atomic_commit */
  2) $ 35186628 us |          } /* drm_atomic_helper_commit_duplicated_state */
  2) $ 35187434 us |        } /* __intel_display_driver_resume [i915] */
  2) $ 35187590 us |      } /* intel_display_driver_resume [i915] */
  2) $ 35216027 us |    } /* i915_drm_resume [i915] */
  2) $ 35216028 us |  } /* i915_pm_restore [i915] */

--- dmesg excerpt (PM, pm_print_times=1) ---

[  385.597875] PM: hibernation: hibernation entry
[  385.675215] PM: hibernation: Marking nosave pages: [mem 0x00000000-0x00000fff]
[  385.675217] PM: hibernation: Marking nosave pages: [mem 0x0009f000-0x000fffff]
[  385.675219] PM: hibernation: Marking nosave pages: [mem 0x410a7000-0x4111cfff]
[  385.675222] PM: hibernation: Marking nosave pages: [mem 0x4d8ab000-0x53bfefff]
[  385.675638] PM: hibernation: Marking nosave pages: [mem 0x53c00000-0xffffffff]
[  385.675972] PM: hibernation: Basic memory bitmaps created
[  385.730889] PM: hibernation: Preallocating image memory
[  391.393882] PM: hibernation: Allocated 1013461 pages for snapshot
[  391.393888] PM: hibernation: Allocated 4053844 kbytes in 5.66 seconds (716.22 MB/s)
[  391.414330] usb usb1: PM: usb_dev_freeze returned 0 after 15370 usecs
[  391.419080] usb usb4: PM: usb_dev_freeze returned 0 after 20841 usecs
[  391.435223] usb usb2: PM: usb_dev_freeze returned 0 after 36470 usecs
[  391.443649] leds hda::micmute: PM: led_suspend returned 0 after 43365 usecs
[  391.446314] i2c_hid_acpi i2c-SYNA310F:00: PM: acpi_subsys_freeze returned 0 after 2015 usecs
[  391.450329] ieee80211 phy0: PM: wiphy_suspend [cfg80211] returned 0 after 6055 usecs
[  391.459706] snd_hda_codec_alc269 ehdaudio0D0: PM: hda_codec_pm_freeze [snd_hda_codec] returned 0 after 15586 usecs
[  391.462576] cs35l41-hda spi1-CSC3551:00-cs35l41-hda.0: PM: cs35l41_system_suspend [snd_hda_scodec_cs35l41] returned 0 after 2293 usecs
[  391.463684] hi556 i2c-INT3537:00: PM: acpi_subsys_freeze returned 0 after 18549 usecs
[  391.488579] nvme 0000:02:00.0: PM: pci_pm_freeze returned 0 after 24125 usecs
[  391.527435] mtk_t7xx 0000:57:00.0: PM: pci_pm_freeze returned 0 after 82328 usecs
[  391.534857] tpm_tis IFX1522:00: PM: acpi_subsys_freeze returned 0 after 68955 usecs
[  391.538757] intel-hid INTC1078:00: PM: acpi_subsys_freeze returned 0 after 3857 usecs
[  391.603542] r8152-cfgselector 3-2.1.2: PM: usb_dev_freeze returned 0 after 203367 usecs
[  391.615386] usb usb3: PM: usb_dev_freeze returned 0 after 10527 usecs
[  393.502223] i915 0000:00:02.0: PM: pci_pm_freeze returned 0 after 2041477 usecs
[  393.505533] mei_me 0000:00:16.0: PM: pci_pm_freeze returned 0 after 3181 usecs
[  393.507588] i915 0000:00:02.0: PM: calling i915_pm_freeze_late [i915] @ 228, parent: pci0000:00
[  393.523756] i915 0000:00:02.0: PM: i915_pm_freeze_late [i915] returned 0 after 15873 usecs
[  393.531869] sof-audio-pci-intel-tgl 0000:00:1f.3: PM: pci_pm_freeze_noirq returned 0 after 5206 usecs
[  393.536400] xhci_hcd 0000:00:14.0: PM: pci_pm_freeze_noirq returned 0 after 9390 usecs
[  393.537623] iwlwifi 0000:00:14.3: PM: pci_pm_freeze_noirq returned 0 after 10905 usecs
[  393.537686] intel-lpss 0000:00:19.0: PM: pci_pm_freeze_noirq returned 0 after 9653 usecs
[  393.537837] intel-lpss 0000:00:1e.0: PM: pci_pm_freeze_noirq returned 0 after 9804 usecs
[  393.537860] mei_me 0000:00:16.0: PM: pci_pm_freeze_noirq returned 0 after 9979 usecs
[  393.537912] pcieport 0000:00:07.2: PM: pci_pm_freeze_noirq returned 0 after 10379 usecs
[  393.537925] pcieport 0000:00:07.0: PM: pci_pm_freeze_noirq returned 0 after 10358 usecs
[  393.537941] i801_smbus 0000:00:1f.4: PM: pci_pm_freeze_noirq returned 0 after 10120 usecs
[  393.537945] intel-lpss 0000:00:15.1: PM: pci_pm_freeze_noirq returned 0 after 6954 usecs
[  393.537958] intel-lpss 0000:00:15.0: PM: pci_pm_freeze_noirq returned 0 after 6988 usecs
[  393.537969] intel-lpss 0000:00:10.1: PM: pci_pm_freeze_noirq returned 0 after 3023 usecs
[  393.538043] mtk_t7xx 0000:57:00.0: PM: pci_pm_freeze_noirq returned 0 after 10526 usecs
[  393.538046] intel_vsec 0000:00:0a.0: PM: pci_pm_freeze_noirq returned 0 after 3383 usecs
[  393.538051] nvme 0000:02:00.0: PM: pci_pm_freeze_noirq returned 0 after 7053 usecs
[  393.538054] intel-lpss 0000:00:10.0: PM: pci_pm_freeze_noirq returned 0 after 10077 usecs
[  393.538101] i915 0000:00:02.0: PM: pci_pm_freeze_noirq returned 0 after 6156 usecs
[  393.538219] intel-spi 0000:00:1f.5: PM: pci_pm_freeze_noirq returned 0 after 4207 usecs
[  393.541780] tigerlake-pinctrl INTC1055:00: PM: intel_pinctrl_suspend_noirq returned 0 after 13106 usecs
[  393.543050] pci 0000:00:1f.0: PM: pci_pm_freeze_noirq returned 0 after 1043 usecs
[  393.543323] intel-lpss 0000:00:1e.2: PM: pci_pm_freeze_noirq returned 0 after 1303 usecs
[  393.543497] pci 0000:00:08.0: PM: pci_pm_freeze_noirq returned 0 after 1388 usecs
[  393.543505] igen6_edac 0000:00:00.0: PM: pci_pm_freeze_noirq returned 0 after 1090 usecs
[  393.543509] proc_thermal_pci 0000:00:04.0: PM: pci_pm_freeze_noirq returned 0 after 1209 usecs
[  393.543509] pci 0000:00:05.0: PM: pci_pm_freeze_noirq returned 0 after 1306 usecs
[  393.543854] pcieport 0000:00:1c.0: PM: pci_pm_freeze_noirq returned 0 after 1825 usecs
[  393.543874] pcieport 0000:00:06.2: PM: pci_pm_freeze_noirq returned 0 after 1793 usecs
[  393.544000] pcieport 0000:00:06.0: PM: pci_pm_freeze_noirq returned 0 after 1953 usecs
[  394.355989] PM: hibernation: Normal pages needed: 974181 + 1024, available pages: 7302451
[  393.696790] i915 0000:00:02.0: PM: calling pci_pm_restore_noirq @ 410, parent: pci0000:00
[  393.698223] pcieport 0000:00:06.0: PM: pci_pm_restore_noirq returned 0 after 1337 usecs
[  393.698244] pcieport 0000:00:06.2: PM: pci_pm_restore_noirq returned 0 after 1299 usecs
[  393.698316] xhci_hcd 0000:00:0d.0: PM: pci_pm_restore_noirq returned 0 after 1193 usecs
[  393.698435] intel-lpss 0000:00:10.1: PM: pci_pm_restore_noirq returned 0 after 1186 usecs
[  393.699066] i801_smbus 0000:00:1f.4: PM: pci_pm_restore_noirq returned 0 after 1301 usecs
[  393.699503] xhci_hcd 0000:00:14.0: PM: pci_pm_restore_noirq returned 0 after 2153 usecs
[  393.699544] intel-lpss 0000:00:15.0: PM: pci_pm_restore_noirq returned 0 after 2126 usecs
[  393.699558] intel-lpss 0000:00:19.0: PM: pci_pm_restore_noirq returned 0 after 2059 usecs
[  393.699568] intel-lpss 0000:00:15.1: PM: pci_pm_restore_noirq returned 0 after 2133 usecs
[  393.699773] intel-lpss 0000:00:1e.2: PM: pci_pm_restore_noirq returned 0 after 2151 usecs
[  393.699827] intel-lpss 0000:00:1e.0: PM: pci_pm_restore_noirq returned 0 after 2261 usecs
[  393.700032] nvme 0000:02:00.0: PM: pci_pm_restore_noirq returned 0 after 1762 usecs
[  393.700053] i915 0000:00:02.0: PM: pci_pm_restore_noirq returned 0 after 3249 usecs
[  393.700066] pcieport 0000:00:1c.0: PM: pci_pm_restore_noirq returned 0 after 2568 usecs
[  393.700173] iwlwifi 0000:00:14.3: PM: pci_pm_restore_noirq returned 0 after 2757 usecs
[  393.700475] sof-audio-pci-intel-tgl 0000:00:1f.3: PM: calling pci_pm_restore_noirq @ 14, parent: pci0000:00
[  393.706375] tigerlake-pinctrl INTC1055:00: PM: intel_pinctrl_resume_noirq returned 0 after 5743 usecs
[  393.711161] thunderbolt 0000:00:0d.2: PM: pci_pm_restore_noirq returned 0 after 14039 usecs
[  393.711162] thunderbolt 0000:00:0d.3: PM: pci_pm_restore_noirq returned 0 after 13989 usecs
[  393.712409] i915 0000:00:02.0: PM: calling i915_pm_restore_early [i915] @ 14, parent: pci0000:00
[  393.717850] i915 0000:00:02.0: PM: i915_pm_restore_early [i915] returned 0 after 5248 usecs
[  393.842119] i915 0000:00:02.0: PM: calling pci_pm_restore @ 412, parent: pci0000:00
[  393.845562] mtk_t7xx 0000:57:00.0: PM: pci_pm_restore returned 0 after 2792 usecs
[  393.845639] xhci_hcd 0000:00:0d.0: PM: pci_pm_restore returned 0 after 3235 usecs
[  393.845673] xhci_hcd 0000:00:14.0: PM: pci_pm_restore returned 0 after 3222 usecs
[  393.846605] proc_thermal_pci 0000:00:04.0: PM: pci_pm_restore returned 0 after 4459 usecs
[  393.846802] acpi-battery PNP0C0A:00: PM: acpi_battery_resume returned 0 after 4140 usecs
[  393.864978] mei_me 0000:00:16.0: PM: pci_pm_restore returned 0 after 22434 usecs
[  393.867756] usb usb1: PM: usb_dev_restore returned 0 after 22090 usecs
[  393.872731] cs35l41-hda spi1-CSC3551:00-cs35l41-hda.0: PM: cs35l41_system_resume [snd_hda_scodec_cs35l41] returned 0 after 7539 usecs
[  393.879291] cs35l41-hda spi1-CSC3551:00-cs35l41-hda.1: PM: cs35l41_system_resume [snd_hda_scodec_cs35l41] returned 0 after 6396 usecs
[  393.887133] cs35l41-hda spi1-CSC3551:00-cs35l41-hda.2: PM: cs35l41_system_resume [snd_hda_scodec_cs35l41] returned 0 after 7651 usecs
[  393.908810] i2c_hid_acpi i2c-ELAN2513:00: PM: i2c_hid_core_pm_restore [i2c_hid] returned 0 after 66001 usecs
[  393.910685] i2c_hid_acpi i2c-SYNA310F:00: PM: i2c_hid_core_pm_restore [i2c_hid] returned 0 after 67873 usecs
[  393.920510] hp-wmi hp-wmi: PM: platform_pm_restore returned 0 after 33257 usecs
[  393.928670] cs35l41-hda spi1-CSC3551:00-cs35l41-hda.3: PM: cs35l41_system_resume [snd_hda_scodec_cs35l41] returned 0 after 8128 usecs
[  393.940156] iwlwifi 0000:00:14.3: PM: pci_pm_restore returned 0 after 97635 usecs
[  393.950842] usb usb2: PM: usb_dev_restore returned 0 after 105154 usecs
[  393.950906] usb usb4: PM: usb_dev_restore returned 0 after 105193 usecs
[  393.982783] usb usb3: PM: usb_dev_restore returned 0 after 137077 usecs
[  394.214258] ieee80211 phy0: PM: wiphy_resume [cfg80211] returned 0 after 274007 usecs
[  394.344541] usb 3-2: PM: usb_dev_restore returned 0 after 361727 usecs
[  394.478666] usb 3-10: PM: usb_dev_restore returned 0 after 495852 usecs
[  395.574828] usb 3-2.1: PM: usb_dev_restore returned 0 after 1230071 usecs
[  395.809482] r8152-cfgselector 3-2.1.2: PM: usb_dev_restore returned 0 after 234522 usecs
[  429.058162] i915 0000:00:02.0: PM: pci_pm_restore returned 0 after 35217884 usecs
[  429.058191] sof-audio-pci-intel-tgl 0000:00:1f.3: PM: calling pci_pm_restore @ 97, parent: pci0000:00
[  429.470283] sof-audio-pci-intel-tgl 0000:00:1f.3: PM: pci_pm_restore returned 0 after 412096 usecs
[  429.470356] snd_hda_codec_intelhdmi ehdaudio0D2: PM: calling hda_codec_pm_restore [snd_hda_codec] @ 97, parent: 0000:00:1f.3
[  429.475831] PM: hibernation: Basic memory bitmaps freed
[  429.476751] Restarting tasks: Starting
[  429.478028] Restarting tasks: Done
[  429.556948] PM: hibernation: hibernation exit
