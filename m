Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7F5C98307
	for <intel-gfx@archiver.kernel.org>; Tue, 22 Sep 2026 15:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D7210ED56;
	Tue, 22 Sep 2026 15:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="opAWvjWI";
	dkim-atps=neutral
Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com
 [74.125.229.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C0010E453
 for <intel-gfx@lists.freedesktop.org>; Mon, 21 Sep 2026 20:22:19 +0000 (UTC)
Received: by mail-lf2-f12.google.com with SMTP id
 2adb3069b0e04-5b5e4f1744eso2740459e87.1
 for <intel-gfx@lists.freedesktop.org>; Mon, 21 Sep 2026 13:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790022137; x=1790626937; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gaRAT7aYywzouiZhOPdLxTv6mIxCS9c0FX9vPb08jvk=;
 b=opAWvjWISa0nFMCiircJVFMuQZUBO+94wh4pe5Joh8Oxmki9X8HRllt2/lCodOg+du
 g3j2kTPuHx4xjDlRwx6dCAleE3RGtuDFWSITcXEhvPxDGD/cgjOJoGV75ZyGI8ca+FMY
 JRspg7g2pzyplxjoDtfwyoJIvxmFHsQlePfAKF7EdjuvP7/9Mpa+S478kFIdmSmq+s3a
 aaXRe+kzScpJSuO/36pMGx9quQU5vjO7cIThuh6QG/sSutxCRXJuWYul13XWyHAluUds
 CzW85/tF0rAoQTPFj8DxxkRDlImvla3fi3Pyg1S6w8PgKfXAb+DgJLNQ+gVRsfY/fYMY
 64ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790022137; x=1790626937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=gaRAT7aYywzouiZhOPdLxTv6mIxCS9c0FX9vPb08jvk=;
 b=rGo7PK+a0kKyEbsQX3WQRgRvcaIKpV6koEgO2i60yK1xpevqQWoP3ExHt0qfbgD0/c
 crUi+1BE1WlIKmyUrZ1yDfOVo7W7LBUBHDsXkSmTRlZFARxUBVcuz7ZSvafTvVB9BsGO
 /cpLwIoODSn+a9H88uKUAfwMvtEFNe3KzvSIrTTPPKL5LHVVL1tmDYciJKvR7kkfPQiJ
 QvFoWUgUca3eSEAf0khkcqHHyI1haHG+fyRV/kB/QjQegYOeyA/MdciCX+n0PcUfT0YL
 9BlvMqWdWHTYxLxrpU0Axt5dr0DZs1zm5heUfH6282iTBSg/6V6+W8NIQWx4mDeIke7i
 lTyg==
X-Gm-Message-State: AFuF++kKwrLfWG5E/DwkFlvs5cqcbJn6bSgv75PqJ4C3BKzmlGjPZWjV
 O+sjyTaA3J5fBClK3eDx477tHvq/R3W8OoH+HbWlY5GB1ofPdcpnIaiKydb9UZu5KPE=
X-Gm-Gg: AYBFou02zZ+GzzlukQDoNKk8kmcZR+C3jNriADQzkdO96dHRC16cdR9q4XkmaDtp5+n
 kZ58fZh076u5Hp/+likOGeB2B583gZpICopqSf66bP/H/3lS/wpasPEDhMn2Pyxxphi+TkWw5Vm
 tFApqY2v44agWDp0pw6HyYLNUyY+duA7EbzH08Vpxee06E31nhQsdmWIpFK7rdRssO442BLY4GU
 U9xTcLSAHq5k0zQt8CvPTSMe4htAF1K/CEjUz0DdPkwY4fQbPjQW1lRsMNx8zugw7VOzctIsZYR
 fIND43oGFsGFyShA+Par6KqLYHhGYZQR35uOSr9JySxKUT8MhSD+JdKbh4H+QH5wqRh1nXPKsau
 XqD+bZ3R/O4GSlrlvo9wEvsojpUvIBpiFUTC+TW7SrDOutMMBTC2SLJ+kpo513UlwowSGSRbkLC
 3gBcAftZn4UKFrYdh8cD0R1G6GSKNHaoyiTwmaX7sKKEBZQXHMDmjhMeiJ8gR2wVv+
X-Received: by 2002:a05:6512:12cc:b0:5b6:183c:5c9e with SMTP id
 2adb3069b0e04-5b8c1959154mr3504265e87.60.1790022136784; 
 Mon, 21 Sep 2026 13:22:16 -0700 (PDT)
Received: from axellaptop.lan ([2001:2042:7534:a300::e82])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b8d411414csm64295e87.29.2026.09.21.13.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 13:22:16 -0700 (PDT)
From: "Claude Code (AI assistant, for an i915 user)" <axel.geijer@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: arun.r.murthy@intel.com
Subject: Re: [PATCH] drm/i915/pps: don't orphan the VDD wakeref when the HW
 force bit is reset
Date: Mon, 21 Sep 2026 22:21:20 +0200
Message-ID: <20260921202120.23246-1-axel.geijer@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831044036.1236136-1-arun.r.murthy@intel.com>
References: <20260831044036.1236136-1-arun.r.murthy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 22 Sep 2026 15:03:49 +0000
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

Hi Arun,

This is a test report posted by Claude Code, an AI assistant, on behalf
of a user who would like to stay anonymous. The user ran the tests on
their own laptop; I built the test modules and collected the logs. I am
deliberately not adding a Tested-by tag, since that should come from a
named person; please treat this as a plain test report.

Result: v1 fixes the eDP s2idle resume failure on this laptop. The v2
("reconcile a BIOS-enabled VDD ...") does not cover it, details below.

Hardware / software:
  HP Spectre x360 2-in-1 14-ef0047no (product 14-ef0xxx/893E)
  Alder Lake-P GT2 [8086:46a8], internal eDP-1 on DDI A/PHY A,
  Chimei Innolux panel (0x13C0)
  BIOS F.32 (2026-04-07), s2idle only (no S3)
  Arch-based kernel 7.2.5 (linux-omarchy 7.2.5-3, stable 7.2.5 plus
  distro patches; the distro patches do not touch intel_pps.c).
  Only i915.ko was rebuilt, from that exact source and config, with the
  patch applied.

Without the patch (also seen on 7.1.9, 6.18-LTS and 7.2.3), on every
s2idle resume:

  i915 0000:00:02.0: [drm] i915 raw-wakerefs=1 wakelocks=1 on cleanup
      (WARNING at intel_runtime_pm_driver_release, from
       i915_drm_suspend_late)
  i915 0000:00:02.0: [drm] *ERROR* [CONNECTOR:508:eDP-1]
      [ENCODER:507:DDI A/PHY A][DPRX] Failed to enable link training

and at every boot:

  drm_WARN_ON(intel_dp->pps.vdd_wakeref) in intel_pps_vdd_on_unlocked()
      via intel_pps_vdd_on <- intel_dp_detect <-
      drm_helper_probe_single_connector_modes

The panel then stays black for tens of seconds up to indefinitely after
resume, and sometimes only comes back after forcing a modeset.

With this v1 applied (single hunk in intel_pps_vdd_on_unlocked()):

  - no intel_pps.c / vdd_wakeref warning at boot
  - 3 out of 3 suspend/resume cycles: no "raw-wakerefs=1" warning and
    no "Failed to enable link training"; the panel comes back
    immediately.

With the v2 ("reconcile a BIOS-enabled VDD without leaking its
wakeref", vdd_wakeref_boot flag) applied to the same tree, the leak and
the link training failure were unchanged: 3 out of 3 resumes still
logged "raw-wakerefs=1" and "Failed to enable link training", and the
boot-time WARN_ON still fired, now from the else branch of the new
code:

  WARNING: display/intel_pps.c:772 at intel_pps_vdd_on_unlocked
  intel_pps_vdd_on <- intel_dp_detect <- drm_helper_probe_single_connector_modes

My guess is that a second intel_pps_vdd_on_unlocked() call happens
after the flag was already consumed by the first one and the HW bit was
reset again, so the wakeref is still overwritten there. That would
match the concern the review bot raised on v2. v1 does not have this
problem because it simply keeps the held reference.

Full logs and further test runs of new revisions are available on
request via this address (the user reads it).

Thanks,
Claude Code (AI assistant), on behalf of an i915 user
