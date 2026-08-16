Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABDBC5DF7A
	for <intel-gfx@archiver.kernel.org>; Mon, 17 Aug 2026 11:52:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19D710E772;
	Mon, 17 Aug 2026 11:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="o0yZZXon";
	dkim-atps=neutral
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D8810E342
 for <intel-gfx@lists.freedesktop.org>; Sun, 16 Aug 2026 19:24:33 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-38a0c7e841fso3634548a91.2
 for <intel-gfx@lists.freedesktop.org>; Sun, 16 Aug 2026 12:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786908273; x=1787513073; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:subject:from:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=w5WDn+zrdr7xrz+goTPQahHR1VbgkRgJ/QPssRayMG4=;
 b=o0yZZXonP9jqXpbexPCsL+RujT16aIBRRWZxOxNTtHONX/SAE8QfxIxa3THSPDXqGR
 DkRBjjj448DXV4LvTOyfte2m1i8xo5r5weApxu408SZSNOhhWKwtZNwfqcHiuORoc6MG
 IhqVaTwXDWBM+rIW7siHE+9uVfuk73sRXDHqTfEDgrUtETIZdmx5vkhaKjAluJpemU7w
 eEVLwsq5CgpzvcSLJkr425r5Tpqwc+ZzQWQHgCzeYsMGiv6t0TLa+ro058BpfToMg3DR
 QMieH7nJ/QdYw2iDBJUjCy3ZFzhShuviK+8g77MFeHevUE0+0HUe77fyR+7HYqUSVhuh
 e5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786908273; x=1787513073;
 h=content-transfer-encoding:content-type:subject:from:to
 :content-language:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=w5WDn+zrdr7xrz+goTPQahHR1VbgkRgJ/QPssRayMG4=;
 b=T3TLptW7rzsls68yv2S9F6JFbYs7xbxb2ENSx3vxgTe7wEhCjlMBLn0bDE2svzG85v
 zeDkup1CwWuxLriVFh0RXxadVOSsUAIp5bd1BYfwFpqv0lfAJhZaYckk1mEJiuQ3pUnX
 3eirG4C672zL/YSZv/Z0c8gRnAffDEga0kpvMlz6xyu2i4xkg9/i/kz5U816VwLl/o4y
 /mxIaoNwpmuyj4rG4c0icx7pzhlyYThkUQF+VygJ6N+l7F2tDEbWV1Rm5tEYTTijfrWf
 uFN/hB1MFhxpFA/2gCoskpGRg5dhQqa4/cZomxdeFIa0vgcllrVJ8ppZxw7pbm+aC4mJ
 RaKQ==
X-Gm-Message-State: AOJu0YyAQ6VHs8tjiMSTpsfrZe7UEzvvjh9Lr/xRXYUggNfvZq7ofQb2
 RAQWubPbfWEeki0bUCI/uIgysB4ZNl75+mzjWQnrkt/TOSPWWLuGHnbcoBq7uw==
X-Gm-Gg: AR+sD10SbwwfSZNeJ9IjKL7uuiV3OKVa8+uHr/Tx5neprd997w7wd2nTPaHU3Zc02w2
 Vok+4oFsjKEVI/GJi0ArboQs291DcGKfMnNaV8Ga+B+8iCqI4HqaP4He1WUBZmShtkopsAYwe7j
 /eeKp1mXnhqIOlI4jDqAHKpof6AT2f2c2N2guAIuqmLwGnbD7iSpzW3vNyG/I0M0APXFv2cFEln
 mBShibQB9Y7oviJb51Z8CY7U3+V0NIJ+3TkepkofDvKdnT/tkvq+ZIN2DbhmLRntFaNrSG7VeId
 EvV6GYYx9oMHnKrwoH/muczc6AbViLMDMmT+Acra9u7ymsw9TL9ttpADRHpsgK4OF71B1P9TC7K
 V7QmknVmoFi1A8ymibdpa+JlqnKxJ86Vqudi3xlBs2j5Ax+6UAUUJyzwwryJ7xhBImOWGLupgKE
 gI5rkshgffA3Q5j7DucYQ1lFxgdffWa1w9kL7UgHu5M/HdOlFcYxHSa6LpTSqcBNpdgUrnlFfLa
 mZ5ChP7ZU5BT7etaENMIAKY7uEXFECgvovcGjZm
X-Received: by 2002:a17:90b:4c48:b0:38e:488f:7068 with SMTP id
 98e67ed59e1d1-3933b6d0d30mr19614536a91.2.1786908273107; 
 Sun, 16 Aug 2026 12:24:33 -0700 (PDT)
Received: from ?IPV6:2605:8d80:58e2:f84d:fe:454d:713f:76ca?
 ([2605:8d80:58e2:f84d:fe:454d:713f:76ca])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39531ec1899sm2247644a91.12.2026.08.16.12.24.32
 for <intel-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 12:24:32 -0700 (PDT)
Message-ID: <b4814185-1fe2-43a8-8d7c-11290c5e38f1@gmail.com>
Date: Sun, 16 Aug 2026 12:24:31 -0700
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Content-Language: en-US
To: intel-gfx@lists.freedesktop.org
From: Novej Panjawani <novej.panjawani@gmail.com>
Subject: [BUG] i915/ADL-P eDP: link training exits with adj_req=0x11
 unresolved, causing modeset loop on CMN14E7 (Dell Latitude 5430)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Aug 2026 11:52:27 +0000
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

## Summary

After boot and after any display mode change (HDMI connect/disconnect), 
the internal eDP display on this Dell Latitude 5430 (ADL-P, Intel Iris 
Xe 46A8) enters an **infinite modeset loop** that repeats every ~2 
seconds: backlight off → pipe disabled → link retrain → pipe enabled → 
backlight on → repeat. This produces continuous visible black-screen 
flashing. The loop self-resolves after ~5–15 minutes (thermal 
stabilization of the eDP connection), and is immediately re-triggered by 
any subsequent mode change.

External HDMI display is not affected.

## Hardware / Environment

| | |
|---|---|
| **System** | Dell Latitude 5430 |
| **GPU** | Intel Alder Lake-P, Iris Xe Graphics — PCI `0000:00:02.0`, 
Device ID `0x46A8` |
| **Panel** | Chimei Innolux CMN14E7 — 14" 1920×1080, eDP 1.4, EDID 1.4 |
| **Kernel** | `6.18.40-1-cachyos-lts` (clang 22.1.8, LLD 22.1.8) |
| **i915** | 1.6.0 — GuC 70.49.4, DMC adlp_dmc.bin v2.20, HuC 7.9.3 |
| **BIOS** | Dell 1.36.0 (2025-12-23) — latest per fwupd |

## Root Cause

With `drm.debug=0x04`, the following loop is captured every ~2 seconds:

1. `intel_dp_start_link_train` uses **vswing 0/0/0/0, pre-emph 0/0/0/0** 
at `LINK_BW_SET=0x0a` (HBR / 2.7 Gbps), 2 lanes
2. TPS1 and TPS2 complete — `"Channel EQ done. DP Training successful"`
3. Pipe A and backlight are enabled (PWM = 23718)
4. ~2 seconds later, link status check:
    - Read 1: `align:0x80 sink:0x3 adj_req0_1:0x11` — aligned, but panel 
requesting vswing level 1
    - Read 2: `align:0x0 sink:0x1 adj_req0_1:0x11` — **alignment lost, 
symbol lock lost**
5. Driver detects link loss → full modeset (backlight off, pipe disabled)
6. Repeat from step 1

**`adj_req0_1=0x11` (vswing level 1 requested for lanes 0/1) appears in 
every DPCD read throughout the flicker window.** The driver exits 
training while adj_req is non-zero and does not apply the requested 
levels to the operational link. The panel cannot sustain HBR at level 0, 
degrades within ~2 seconds, fires IRQ_HPD, the driver responds with a 
full modeset, and the cycle repeats.

## Debug Log (one complete cycle)

Captured with `drm.debug=0x04`:

```
i915: [drm:intel_dp_start_link_train] Using LINK_BW_SET value 0a
i915: [drm:intel_dp_set_signal_levels] 8b/10b, lanes: 2, vswing levels: 
0/0/0/0, pre-emphasis levels: 0/0/0/0
i915: [drm:intel_dp_link_train_phy] Clock recovery OK
i915: [drm:intel_dp_link_train_phy] Channel EQ done. DP Training successful
i915: [drm:intel_dp_link_train_phy] Link Training passed at link rate = 
270000, lane count = 2
i915: enabling pipe A
i915: [drm:cnp_enable_backlight] set backlight PWM = 23718

-- ~2 seconds --

i915: [drm:intel_dp_dump_link_status] ln0_1:0x73 align:0x80 sink:0x3 
adj_req0_1:0x11   <-- link ok, but adj_req non-zero
i915: [drm:intel_dp_dump_link_status] ln0_1:0x73 align:0x0 sink:0x1 
adj_req0_1:0x11   <-- link lost

i915: [drm:cnp_disable_backlight] set backlight PWM = 0
i915: [drm:intel_disable_transcoder] disabling pipe A
i915: [drm:intel_hpd_irq_handler] Received HPD interrupt on PIN 4 - cnt: 10
i915: [drm:intel_dp_hpd_pulse] ignoring long hpd on eDP [ENCODER:262:DDI 
A/PHY A]

-- repeat every ~2 seconds --
```

## Reproduction

1. Append `drm.debug=0x04` to kernel cmdline, reboot
2. `journalctl -k -f | grep -E 
"link_train|dump_link|hpd|backlight|transcoder"`
3. Cycle appears within seconds of display init, repeats every ~2 seconds
4. After 5–15 min, cycle stops (thermal stabilization)
5. Retrigger: unplug external display → cycle immediately resumes

## Expected Behaviour

Either:
- **(a)** The TPS2 loop should continue iterating and updating 
vswing/pre-emph until `adj_req` is zero before declaring training 
successful; or
- **(b)** After training exits, the driver should apply the final 
`adj_req` vswing values to the DDI buffer translation used for normal 
operation

## Attempted Workarounds (all ineffective)

None of the following affect link training vswing behavior:
- `i915.enable_psr=0`, `i915.enable_panel_replay=0`
- `i915.enable_dc=0`, `i915.enable_sagv=0`, `i915.enable_fbc=0`, 
`i915.enable_dsb=0`
- `i915.edp_vswing=2` — selects 400 mV DDI translation table but does 
not force vswing level 1 in the training loop
- `i915.enable_rc6=0` — silently ignored ("unknown parameter"); GuC RC 
remains active
- `xe.force_probe=46a8` — xe exhibits a separate fatal bug: continuous 
GTT plane faults in stolen framebuffer memory (~300K–600K suppressed 
callbacks per 5 seconds)

## Notes

- Issue self-resolves after thermal warmup, strongly suggesting the 
physical link is borderline at HBR/level-0 — applying level 1 should 
resolve it permanently
- BIOS 1.36.0 is the latest (confirmed via fwupd)
- External HDMI (pipe B) is unaffected throughout

