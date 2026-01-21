Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B04C44506
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Jan 2026 20:47:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A642C10E882;
	Wed, 21 Jan 2026 20:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ihz6M1ws";
	dkim-atps=neutral
Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D8910E886
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Jan 2026 20:47:15 +0000 (UTC)
Received: by mail-dl1-f73.google.com with SMTP id
 a92af1059eb24-124627fc58dso581034c88.1
 for <intel-gfx@lists.freedesktop.org>; Wed, 21 Jan 2026 12:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769028435; x=1769633235;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=g2+Fzre968mq+nwMqVpyFNeMYaQ7CCrarJ0N99hrtiE=;
 b=ihz6M1wsI6nS9H1SOXcOjFFpObGG9C0oYhiv0T5yuY0I8V3Q7I+9HjzGRkNT0TgKhq
 yQLz2yG8DGf89AMY2YNm33YKNp+QsjNQGAuyylM0fyN4THkSfN93aMqYrgSC2YjhcA6y
 pP03SRNdJLKuvNQvoXbqIesJAjKgsQkJ44B7VsbQ8d7gCy736JdTEuNSS68yndrj3Rjp
 bPg6DfVljXOz2VsM+InijwHtx8E18gR/gwdIQ3azgh+GhaaCuYN5h1++zrwsr0NQQ69U
 DST+7sLUPxBE7Pb74A0V9YtO3uypo0CGR0RGHSpP68YkN/MrLZ0TFXFzHvNuqnXJkZBv
 6AoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769028435; x=1769633235;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g2+Fzre968mq+nwMqVpyFNeMYaQ7CCrarJ0N99hrtiE=;
 b=Bl2i7EbePAo8pBKoDTpC15zv2ZkF7GOp670z4ApDSHZyoZWpIgxOWSft2ua/wGBHs9
 rWf9kzCAR0O1/TuDiOAfsQKGayT692vRbWAbN2Ro01NAz5n2Z8RB95nw5GbsQoLZuQps
 /tENreVzqnE7qfbv4OI/cBcs028zZygPDhG9vSwMR/70L/ln/zhKViwHnk+Gi5RjH/T/
 wrjTUHGtFEGgEcWB2iuuxYBQ0g2RolfNhdYVJ66KxrNqw5u/tE3WQUMwtd7jU7KV4/Kv
 RdEraaXTXL7n09T/0+xABXf5JXqEzcN0utb1+xBIESRWtbtZFZ/Yu6scOYot8LTSFjNV
 ZxAg==
X-Gm-Message-State: AOJu0YzFxLBQxM/Lysy2EJv4GMGuGpgWIN8uk6k+Vk5UTPrSmkjTbaRX
 rgUuS9I2MM9qoIEFoNZuwcibgMNysXYx+qldFpSaF3n6HFD05vGHPB3/YhbkgcFXCUo/DCuC36i
 i6UukNlianRh6pt7LxapzPd3OHEfdrkFVfl+upz4tPY/6/qTYFJH21Ld4Ryq3DmE2zAAjgVXyvN
 o7UuN7dml8oshRNJlMylwiQvLmTQlLLttOjFFslx2URMSIxKpB5+kZ0dQ/bwE=
X-Received: from dlbvv19.prod.google.com
 ([2002:a05:7022:5f13:b0:119:9f33:34a6])
 (user=jdsultan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:1284:b0:11d:f037:891c with SMTP id
 a92af1059eb24-1246aacf7admr3844053c88.44.1769028434685; 
 Wed, 21 Jan 2026 12:47:14 -0800 (PST)
Date: Wed, 21 Jan 2026 12:46:51 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260121204705.432290-1-jdsultan@google.com>
Subject: [RFC PATCH v3 0/2] Enable seamless boot (fastboot) for PTL
From: Juasheem Sultan <jdsultan@google.com>
To: intel-gfx@lists.freedesktop.org, intel_xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Manasi Navare <navaremanasi@google.com>, Drew Davenport <ddavenport@google.com>,
 Sean Paul <seanpaul@google.com>, Samuel Jacob <samjaco@google.com>, 
 Rajat Jain <rajatja@google.com>, Juasheem Sultan <jdsultan@google.com>
Content-Type: text/plain; charset="UTF-8"
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

Resending with cover letter from v2. There were no significant code
changes. Only resending due to mail failure.

This patch series is the second revision of a series of patches meant
to add support for seamless framebuffer handoff within the Xe driver.
It was tested on Panther Lake platforms.

The goal of this series is to achieve a flicker-free transition from
the bootloader (BIOS/UEFI) to the kernel driver by strictly adhering
to the hardware state established by the firmware.

Thank you for the feedback on the previous revision.

This new patch series was created with that feedback in mind. That
revision was too rough of an implementation that had a considerable
amount of useless code and fixed problems that it unecessarily
introduced. Because of that, I completely reworked and rewrote the
solution into a much smaller, efficient version that properly makes
use of the existing infrastructure. This patch series has two specific
focal points. It enables Xe to properly adopt a framebuffer from bios
by fixing how we read stolen memory and it synchronizes an inherited
crtc state with the new state so that we can perform an initial commit.
This allows us to achieve seamless handoff between the firmware and
kernel with minimal changes required.

---
Changes since v1
- v2 Complete rewrite of the code
- v3 Resending due to failure of patches to send

Juasheem Sultan (2):
  drm/xe/display: Fix reading the framebuffer from stolen memory
  drm/i915/display: Synchronize crtc_state for initial commit

 drivers/gpu/drm/i915/display/intel_display.c  | 19 ++++++++++++++++
 drivers/gpu/drm/xe/display/xe_plane_initial.c | 22 ++++++++++++++++++-
 2 files changed, 40 insertions(+), 1 deletion(-)

-- 
2.52.0.457.g6b5491de43-goog

