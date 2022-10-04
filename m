Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8DBC433F5
	for <intel-gfx@archiver.kernel.org>; Tue,  4 Oct 2022 14:40:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B7410E203;
	Tue,  4 Oct 2022 14:40:21 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959E110E203
 for <intel-gfx@lists.freedesktop.org>; Tue,  4 Oct 2022 14:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664894418; x=1696430418;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k0nA2ReUQo230Yn8dSHyFc/MHTBLKZD9tXTTvrramTc=;
 b=OZ/PsfakEo3TrK6qkmhvHplRHpnV16CdZ8A+pELN0YIAypFUiSi5vy2i
 rRHH4YeOXfZSZsmC76nxC6q86Ie9Xz/D1NQtQyd0GpjIICF/0zav6B4mk
 6ISitZCwnQV5SLWDV+f4wb1Mb+x7qe69kfrnRnDfXEGaAvwrkrONnoDFM
 qA0j9B2Y2uH1LvG5rYM7Q1D9Vr6K4DyRjb0IvWzvOF851VILH54iwqEvz
 aNtEvjGZ1N6lAZOatByu92/9ldAm/+RPiCu14dxPzaY87Iqcx54FCFTpb
 JBmmQ6B/14GVgZ2Sku21wMp6qfzXD0iKCOOBE0PREHjm0kJWPn+ChD8f1 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="364824497"
X-IronPort-AV: E=Sophos;i="5.95,158,1661842800"; d="scan'208";a="364824497"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 07:40:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="869022849"
X-IronPort-AV: E=Sophos;i="5.95,158,1661842800"; d="scan'208";a="869022849"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga006.fm.intel.com with SMTP; 04 Oct 2022 07:40:15 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 04 Oct 2022 17:40:14 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  4 Oct 2022 17:40:12 +0300
Message-Id: <20221004144014.6199-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 0/2] drm/i915: Try not to screw up the pps
 during panel probe
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

I had to stare at the pps stuff again while dealing with the -stable
pps regression. While doing that I figured I'd try to make it so we
don't accidentally use the wrong pps during the panle probe when we
don't yet have the VBT parsed. So here's an attempt at deducing the
correct pps from the hardware state.

Cc: Animesh Manna <animesh.manna@intel.com>

Ville Syrjälä (2):
  drm/i915: Generalize the PPS vlv_pipe_check() stuff
  drm/i915: Try to use the correct power sequencer initially on bxt/glk

 .../gpu/drm/i915/display/intel_connector.c    |   3 +
 .../drm/i915/display/intel_display_types.h    |   8 +-
 drivers/gpu/drm/i915/display/intel_pps.c      | 105 ++++++++++++++----
 3 files changed, 93 insertions(+), 23 deletions(-)

-- 
2.35.1

