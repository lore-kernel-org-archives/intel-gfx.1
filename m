Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6837C43458
	for <intel-gfx@archiver.kernel.org>; Wed,  1 Jul 2026 12:57:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6136410EFD0;
	Wed,  1 Jul 2026 12:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="uYwb7DGz";
	dkim-atps=neutral
Received: from mail-qt1-f201.google.com (mail-qt1-f201.google.com
 [209.85.160.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D7C10F518
 for <intel-gfx@lists.freedesktop.org>; Fri, 26 Jun 2026 21:45:17 +0000 (UTC)
Received: by mail-qt1-f201.google.com with SMTP id
 d75a77b69052e-51a19f736a1so23027761cf.2
 for <intel-gfx@lists.freedesktop.org>; Fri, 26 Jun 2026 14:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1782510316; x=1783115116;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Cia7kgRPhjI1x3e7gMKFsSdD516IvT1B7tWFopyj8HA=;
 b=uYwb7DGzwPuHqHm6jN3nq9ufwa3MTtjfL6d4+vBL0FI6x9zQqZ0/2tO8TKK8cr3heA
 WIw2NvEUD+oQjjUXapzR/QFk/Z/vQFPqA3+FWcMX7wEvlp19juuoQS299T07s7D5m4Tk
 V4Q2Snq7QxViIPSKDorLd3BcmNjaL5fIG0Wkrg7ACfmrRyPyGDuRY98sfQb0JFafdNAk
 KO5lt7a28MaJzsafXwJJO+9NhPc83dtbczKTJN0KqlnuvTfTxZNhARfREXDjm6xuv6nE
 qcyVY3IgsM/Nq7CvS7s8LiUocqhyPuzbg5lVbujjvl4eB3Dnwrm2lsxirBVKsK2y7xs2
 om+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782510316; x=1783115116;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cia7kgRPhjI1x3e7gMKFsSdD516IvT1B7tWFopyj8HA=;
 b=WrD1e0iex3JbVfE1RtqyIe6XaZ8ToG6YBX0Ai1Klu8AqQm6hjQiqcH1rwr9yPv0CE+
 grZaJ0FmP+LaMxXYdaSuUrWMdaagMUY52FU6tZ4tnPZmWyneIPL/VyzdGvo93AEhqKV3
 roNXkPWdXbNIGNjRgnd0c5+pk+zIm8CQuKChlaAmf/njzaAvWJQbhHn+xsWUGgHk4bsK
 EPlPP+8zjpkAeXFWcrbfE6pJdoLogP5BCXFjSTihDfJivI6tjM0K4/tM4e3p4hYceHH3
 7WD6itOHp+RrzkX1guLeulSP6D7ZSr92TfUhXQrjrKSpKHaigLJGDckG24oOQh7eQMDw
 8TsA==
X-Gm-Message-State: AOJu0Yw/AOzWp+5EY6zf8hu+gd+HSUDwiDe/wteY8LJyoQHdYNloXrOw
 vhOa+5LYavdwYT1gN/3GOY4VLeVaV9U+Gy4k/aXtxaITmNZjWztwDO6rZfb4dnySXA0lVRpZb/I
 JqTBcUxCbkch36iI7L26TYl5V1DX8R7gnMZJ+Krhy0oI+22YHOzrXB17NPTtML6AdI1ATq2HLAw
 KF2shbDIWqcgtwHAfCTkTGHuhveR2AkaScQZ9nykMGOMP62tgX7e+h09f0uoE=
X-Received: from qtbea9.prod.google.com ([2002:a05:622a:5b09:b0:51a:8593:7099])
 (user=gildekel job=prod-delivery.src-stubby-dispatcher) by
 2002:ac8:5f87:0:b0:51a:9a12:9f02 with SMTP id
 d75a77b69052e-51a9a12be9emr9496141cf.36.1782510315081; 
 Fri, 26 Jun 2026 14:45:15 -0700 (PDT)
Date: Fri, 26 Jun 2026 17:44:40 -0400
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626214513.179943-1-gildekel@google.com>
Subject: [PATCH v3 0/2] drm/i915/display: Enable HDR over DP MST
From: Gil Dekel <gildekel@google.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, jani.nikula@intel.com, imre.deak@intel.com, 
 khaled.almahallawy@intel.com, navaremanasi@google.com, 
 Gil Dekel <gildekel@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 01 Jul 2026 12:57:46 +0000
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

Currently, the Intel display driver does not support HDR over DP MST
connections. This series enables this functionality.

To achieve this:
1. We refactor colorimetry capability queries to query and cache the value
   on a per-connector basis (for both SST and MST downstream sinks)
   instead of checking the root port's DPCD register directly (which returns
   false for MST hubs).
2. We update the MST stream configuration to compute the required VSC and
   HDR metadata SDPs.
3. We set the transcoder's Video DIP registers on stream enable and during
   fastsets (update_pipe) to propagate HDR metadata changes without forcing
   a full modeset.
4. We expose the max_bpc, HDR metadata, and DP Colorspace properties on
   MST connectors.

Link to v1/v2 discussion:
https://lore.kernel.org/r/20260625160020.2873859-1-gildekel@google.com

Changes in v3:
- Stripped Gerrit Change-Id tags from commit messages.
- Added Assisted-by: jetski:gemini-2.5-pro tags.

Changes in v2:
- Fixed critical Werror CI build break (-Wunused-but-set-variable) by
  removing unused display variable in intel_dp_compute_vsc_sdp().
- Resolved checkpatch warnings by hoisting variable declarations and
  restoring missing blank lines.
- Gated attaching MST HDR_OUTPUT_METADATA property on
  intel_dp_has_gamut_metadata_dip() for consistency with SST.
- Removed redundant direct max_bpc assignment on connector struct.

Gil Dekel (2):
  drm/i915/display: Cache DP colorimetry support per-connector
  drm/i915/display/mst: Enable HDR over DP MST

 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 25 ++++++++---
 drivers/gpu/drm/i915/display/intel_dp.h       |  8 ++++
 drivers/gpu/drm/i915/display/intel_dp_mst.c   | 44 +++++++++++++++++--
 4 files changed, 68 insertions(+), 10 deletions(-)

--
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics
