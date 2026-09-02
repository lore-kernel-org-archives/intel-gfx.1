Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D79C624DE
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Sep 2026 16:00:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9388C10F695;
	Thu,  3 Sep 2026 16:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="jSdmy2EC";
	dkim-atps=neutral
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27F810F2D0
 for <intel-gfx@lists.freedesktop.org>; Wed,  2 Sep 2026 16:21:54 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-90cd43bd740so13580496d6.1
 for <intel-gfx@lists.freedesktop.org>; Wed, 02 Sep 2026 09:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1788366114;
 x=1788970914; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=SfJH9vhjqtmBoYyPyMhuEymgSaj6+9PIIKrF1IdfT1s=;
 b=jSdmy2ECan2/Y0k/UXm+cdwhEhbpmb13ezfygr27Q1S/DET7oLonF/GWwD3e2FVhj6
 WagV3Eci1QlT3etfhnDLtNpJjZKWGKDwSXCBTN+0Xs0T6EzN3tEzO7+Ce4MUgoe+Mkov
 3a0ZB44l1MUIriz/zYKaTKVT4hmiq8KAwXsoS5zvAio8pLQG3lCRU8GC3XnwKR1Ecp/+
 DWxJR8trQ5/Lt/8lrRBtTC4JsAfu9grfslIXGXItIjiKjP9TJAgEm7hg31IbR+HGNIjV
 UjJyiIhClfWEDwbZamWeAgCCautICdU0O7AYV4HYpo2LoFjDuYd5ELyIh/yIyyuLST2A
 LEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788366114; x=1788970914;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SfJH9vhjqtmBoYyPyMhuEymgSaj6+9PIIKrF1IdfT1s=;
 b=PdmeYqP/oBewcb5a/r/xRUjxPMJ3Mr9HxViwYut2cHJlY8pf4XXsXG3A7KkaWlwTkt
 +IPjjN8R6V5ai02xN20oeduMSYUiYTwRLqDldjKvaANLR9raCmtytf5s2Q91m/qx7+PW
 MK4Y/26dD7gGC01DMI5Eosvkb+vgV9VU3NVz7ofVrqwGyZni08i3wsZU4G8XBAJAc+X6
 1so5Gy7DfINik9mmFjxe1dw2AoUP+Nge09LP17qc/EIodvrvKUqjqzFmboC56Uc0sAvl
 fhm5h7GdV3KHZO19EiyMIEhO62FOYVjh5guwu2szsFA3kz5UK+CWw4zTZvxo5k3vfmb0
 r+rg==
X-Gm-Message-State: AFuF++nPIyLcmhWhLHQYv+XdmlL/Rroe2qftt8s04Aefdm59P1jJ1ONg
 eDpHgLA9BW0vQqFaC+rdyac6XgFwzdA3B8x9sQh5ff84gQjmRL+tNizTAeRRYX0r2VKDeYDacY0
 cBOIQcuTXfINyrwjntJXiW4HdoAh5LTGsECPNsy0s0KFbAmB9EdonTK+2UExCVxhI2SPcifa5zF
 RjZThejFBCmVIFYpvmwgeABlRk+jeyad6JJS8sW7tCfcgqewqABx4abRU=
X-Gm-Gg: AYBFou3/dzU94Ssd06S7udqdi8AEm8aTsB6u65H7tKUIJQ23Nhk+4rykuw3JM/FArIg
 CsqLKgW5lrJmVaHoFv1/BXrVaj+bnJTQniAA14/iZZK4Y+6rZNlSPaNp0CZDTMIrQEEcT8q7Tw8
 Vk8AJiv9wITCpEbgEwNkZpgheSlVpKj5IBPdb9j9zWFY3StbzKjff1pQHRg27KTbcBxyUNPdWoi
 S28C+55gEuXyyIWpZGACdOCsVNN4Z0EeQtXQ69IA9P1TRtj/ohk4HNICrQb+AZhyG8PogDdNCo8
 QeN/zu2UMxJj6IjDquiWrhV7BMQvoSBzfXg+J1P2u43o6Icbr2chB+a3cDDSD4/HT/io3f7WI3h
 j+CcrwI8rdYkjRCw/HvjhME8WJsr5+yFSzosMGVLgIGwwywPgDIL1UwhjqFw+XMmDlfbWCt/7Iz
 l8XLs0CuHZgzbBWD4PSlHD+P8SKkmkXx9+6KKsC1Z1yWweJjWFFk/n8jSRXhtc2R5FxRghWj0Hc
 S7J2xUYvobFhmBXA83TlmbJMs9UQBNj+72ee+5d6c2XEo3+yk2g1jt/EMcEccOgoq5Rvmgk5pIl
 rpeDOsz03I77ISMgqMrJhftG2mNg2r2dSk07TNgPmJEcaQWxUgeBjQVNxBs=
X-Received: by 2002:a05:6214:23c6:b0:90e:8a62:3344 with SMTP id
 6a1803df08f44-90e9f26550cmr74337096d6.13.1788366112573; 
 Wed, 02 Sep 2026 09:21:52 -0700 (PDT)
Received: from jake-laptop ([74.244.125.34]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90e9eec7608sm21376836d6.26.2026.09.02.09.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 09:21:52 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [BUG] PTL eDP PSR2 SU / Panel Replay: engine parks in SU_STANDBY,
 panel never refreshed (Dell XPS 16 DA16260)
Date: Wed,  2 Sep 2026 12:21:50 -0400
Message-ID: <20260902162150.58778-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 03 Sep 2026 16:00:11 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


Post as a drm/xe gitlab issue (component: display), then a short note to intel-gfx / intel-xe with the link.

Summary

Dell XPS 16 DA16260: Panther Lake, display ver 30.00 B0, xe driver, 8086:b080 / subsystem 1028:0dba, BIOS 1.8.2.
Panel: LG (sink OUI 00:22:b9), eDP 1.5 (DPCD 0x700 = 0x06), PSR cap 0x70 = 0x04 / 0x71 = 0x7b, PR cap 0xb0 = 0x07,
ALPM cap 0x2e = 0x05, Y granularity 4. Mode 3200x2000@120, 858.01 MHz, htotal 3360, vtotal 2128, DSC 2 slices /
2 VDSC streams, 4 lanes x 2.7 Gbps.

PSR1 works. PSR2 selective update and eDP Panel Replay (every variant) leave the panel showing a stale frame while
the compositor keeps committing at 120 Hz. This is the machine behind the eDP Panel Replay quirk in intel_quirks.c
(XPS 14 DA14260 / XPS 16 DA16260); the quirk hides it for PR only, PSR2 has the same problem.

Windows on the same hardware uses PSR2/Panel Replay normally, so panel and link are capable.

Two separate findings

1. (fixed, patch posted) ALPM extended fast wake == IO buffer wake (11 == 11 lines on this mode) makes every link
   wake fail on this panel: DP_PSR_ERROR_STATUS Link CRC error relatches within ~25 ms for as long as PSR2 is
   active. Fast wake strictly greater than IO buffer wake fixes the CRC errors. Patch: "drm/i915/alpm: Keep the
   extended fast wake ahead of the IO buffer wake" (posted separately). The error-status ack patch
   "drm/i915/psr: clear the Panel Replay error status register" is already in drm-intel-next.

2. (this report) With the wake fixed, the PSR2/PR engine stops transmitting selective updates.

Observation (instrumented kernel)

EDP_PSR2_STATUS is sampled at every TRANS_PUSH frame-change request and printed as a histogram in
i915_psr_status; the sink is polled over /dev/drm_dp_aux0.

Typical 30 s PSR2 run with animated content, ~4000 push requests:

PSR2 state at each push request: IDLE=18 CAPTURE=2 SLEEP=2 SU_STANDBY=4061
sink 0x2008 = 0x02 (active, display from RFB), 0x200a = 0x01 (last SDP: PSR_STATE only, never SU_VALID)
sink 0x2006 / 0x2020 = 0 (no errors), EDP_PSR2_STATUS = 0x68200011, PSR2_CTL = 0x8a00c399
PSR2_MAN_TRK_CTL = 0x800007cf (partial frame, region 0..1999), LNL_SFF_CTL = 0
TRANS_PUSH = 0x80010000 between commits (PUSH_EN | PSR_PR_EN), SEND consumed every frame
TRANS_VRR_CTL = 0xa400003c: fixed RR, vmin = vmax = flipline = 2128, guardband 60, crtc_vblank_start 2068, SCL 1

So the engine performs exactly the two captures after enable (frames before SU), then sits in SU_STANDBY for
every following frame change. Panel Replay: same picture (additionally, with DSB enabled the commit rate drops
to ~35/s; with xe.enable_dsb=0 commits run at 120/s and the panel is still frozen). Nothing is logged.

Ruled out by direct A/B on this machine (panel frozen every time, identical histogram)

Feature configuration:
- Early Transport off; SDP-prior-scanline indication off; PR without selective update (continuous full frame);
  PR with and without ALPM; PSR2 with ALPM disabled entirely (no ALPM_CTL, no DPCD 0x116)
- link rate 2.43 vs 2.7 Gbps; DSC 8 vs 10 bpc input; psr_safest_params; aux-less wake 20..58 lines
- DSB on and off; CURSURFLIVE frame change instead of TRANS_PUSH (sink then never enters PSR at all)
- AS SDP advertised-vs-transmitted mismatch fix for PR (DPCD 0x107 bit 6 vs PR_ALPM_CTL)
- all sink CRC / error config bits; DC states untouched (PR holds DC_OFF while vblank is enabled)

Timing generator / push (display 30 fixed-RR VRR TG), each verified in the registers before the run:
- TRANS_PUSH_EN cleared in fixed RR so the PSR push is a SW strobe as on LNL (TRANS_PUSH = 0x40010000): no change
- guardband forced to the full vblank, 127 lines (TRANS_VRR_CTL = 0xa400007f, delayed vblank == real vblank): no change
- push request scanline / SEND-still-pending / PUSH_EN instrumentation: SEND is never still pending at the next
  request, PUSH_EN always set

Sink / EDID:
- sink MSA_TIMING_PAR_IGNORE (DPCD 0x107 bit 7) cleared before PSR2 enable: no change (sink then reports
  0x2008 = 0x04 instead of 0x02, still no SU_VALID)
- cold boot with the panel's native EDID (no VRR range, vrr.in_range = false), PSR2 enabled first thing after boot
  with no prior PSR2/PR history: frozen, so this is not register contamination from mode switches
- (an EDID override adding a 20-120 Hz block-0 range descriptor was in use in earlier runs; native and override
  timings are byte-identical, the panel carries the same range only in its DisplayID adaptive-sync block)

Code review against drm-tip 2026-09-02: no upstream change touches the PSR2/PR SU, TRANS_PUSH or VRR-TG path after
7.3-rc1; every per-commit register value (PSR2_MAN_TRK_CTL, PIPE_SRCSZ_ERLY_TPT, DSC SU params, SEL_FETCH_*,
PSR2_CTL, ALPM_CTL) matches what the driver writes on LNL for the same geometry.

Same signature elsewhere

drm/xe #8924 (PTL PR without sel-fetch parks in SLEEP), #8930 (WCL XPS 13, same LG OUI 00:22:b9, PR SU stutter),
#7682 (this machine), and the DA16260 report on intel-gfx with LG OUI 00:aa:01 (~5 fps, SLEEP / SU_STANDBY).

Recovery

PSR1 + modeset is often not enough; PSR fully off + DPMS cycle + output disable/enable + link retrain is.

What would help

Bspec guidance on what the PSR2/PR engine on Xe3 LPD needs to leave SU_STANDBY and start a selective update
after a frame change in fixed-refresh VRR-TG mode with DSC (two VDSC streams): any ordering or timing requirement
between PSR2_MAN_TRK_CTL / PIPE_SRCSZ_ERLY_TPT / plane SEL_FETCH writes and the push, any register the driver
does not program on display 30, or a known Xe3 W/A. The engine ignores frame changes from both TRANS_PUSH and
CURSURFLIVE, in every feature configuration and at every timing reachable from the driver, so this looks like a
missing programming step rather than a wrong value.

Kernel: 7.3.0-rc1 (CachyOS) with the two patches above, the Dell PR quirk entry removed, and local debugfs
instrumentation (histogram, push diagnostics, timing knobs). Scripts, logs and the instrumentation patch are
available on request. The 30 s PSR2 log is appended below.


Appendix: 30 s PSR2 run on 7.3.0-rc1 (local instrumentation), no EDID override, cold boot

=== knob_step baseline [] PSR2 11:51:12
  knobs: vrr_no_push_en_fixed_rr=N vrr_guardband_override=0 psr_msa_ignore_fix=N psr_no_alpm=N psr_no_trans_push=N 
### STARTED: baseline for 30 s. Use the desktop now. 11:51:20
  11:51:20 mode: PSR2 enabled (Early Transport) | 107=00 170=f1 1b0=00 116=03 2006=01 2020=00 2008=02 200a=01 PSR2_STATUS=0x68200011 TRANS_PUSH=0x80010000 | 
  +5s 2006=00 2020=00 2008=02 200a=01 PSR2_STATUS=0x68202411 TRANS_PUSH=0x80010000
PSR2 state at each push request: IDLE=24 CAPTURE=3 SLEEP=7 SU_STANDBY=1004 DEEP_SLEEP=1
Push phase (active/vblank-before-delayed/after-delayed): 1039/0/0, SEND still pending: 0, PUSH_EN seen: 1039
  +10s 2006=00 2020=00 2008=02 200a=01 PSR2_STATUS=0x68200011 TRANS_PUSH=0x80010000
PSR2 state at each push request: IDLE=24 CAPTURE=3 SLEEP=7 SU_STANDBY=1608 DEEP_SLEEP=1
Push phase (active/vblank-before-delayed/after-delayed): 1643/0/0, SEND still pending: 0, PUSH_EN seen: 1643
  +15s 2006=00 2020=00 2008=02 200a=01 PSR2_STATUS=0x68200011 TRANS_PUSH=0x80010000
PSR2 state at each push request: IDLE=24 CAPTURE=3 SLEEP=7 SU_STANDBY=2211 DEEP_SLEEP=1
Push phase (active/vblank-before-delayed/after-delayed): 2246/0/0, SEND still pending: 0, PUSH_EN seen: 2246
  +20s 2006=00 2020=00 2008=02 200a=01 PSR2_STATUS=0x68200011 TRANS_PUSH=0x80010000
PSR2 state at each push request: IDLE=24 CAPTURE=3 SLEEP=8 SU_STANDBY=2813 DEEP_SLEEP=1
Push phase (active/vblank-before-delayed/after-delayed): 2849/0/0, SEND still pending: 0, PUSH_EN seen: 2849
  +25s 2006=00 2020=00 2008=02 200a=01 PSR2_STATUS=0x68200011 TRANS_PUSH=0x80010000
PSR2 state at each push request: IDLE=24 CAPTURE=3 SLEEP=8 SU_STANDBY=3415 DEEP_SLEEP=1
Push phase (active/vblank-before-delayed/after-delayed): 3451/0/0, SEND still pending: 0, PUSH_EN seen: 3451
  +30s 2006=00 2020=00 2008=02 200a=01 PSR2_STATUS=0x68200011 TRANS_PUSH=0x80010000
PSR2 state at each push request: IDLE=24 CAPTURE=3 SLEEP=8 SU_STANDBY=4017 DEEP_SLEEP=1
Push phase (active/vblank-before-delayed/after-delayed): 4053/0/0, SEND still pending: 0, PUSH_EN seen: 4053
  11:51:51 mode: PSR2 enabled (Early Transport) | 107=00 170=f1 1b0=00 116=03 2006=00 2020=00 2008=02 200a=01 PSR2_STATUS=0x30202411 TRANS_PUSH=0x80010000 | 
  knobs: vrr_no_push_en_fixed_rr=N vrr_guardband_override=0 psr_msa_ignore_fix=N psr_no_alpm=N psr_no_trans_push=N 
  11:51:59 mode: PSR1 enabled | 107=00 170=05 1b0=00 116=00 2006=00 2020=00 2008=00 200a=00 PSR2_STATUS=0x04000010 TRANS_PUSH=0x80010000 | 
### ENDED: baseline. Back on PSR1. 11:51:59
=== done 11:51:59
