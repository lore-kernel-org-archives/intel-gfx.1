Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB6E606A31F
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Nov 2026 18:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kyPAM3hW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F81112CAF;
	Fri, 27 Nov 2026 18:00:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1313B112CAF
 for <intel-gfx@lists.freedesktop.org>; Fri, 27 Nov 2026 17:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795802398; x=1827338398;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=elMB5+Gsanw+wu6mUEZMtQwHqfP8QZ2/cpVYj2hyXcs=;
 b=kyPAM3hWyKUM8UgS56fbT5fquael7fKvWuzExOOxOczp3E6E5H+eIOjW
 7FI9rYlGiJW5uIF9BgZsd36mCBmmpxBlemf081tLR2n0fMOjWGHeJW6+u
 a4wfVwtwSUFKLznBs4kaw6U33PsfDV2ywBVfNA1ezT/KAhxxUZ/5MMehJ
 igftX2YNFUcduW5mt4qwCCVCj0DbSyKvdrZGz9z9F/vzsae8DTlWmoZC/
 gDmfJrQM3Xv+N7TVPzIsJ6TM+P22WddqJM43jq9sB0bZn5eHNLOcrh6AC
 aSCj90Ai10Eyaa9w48yqIGmdspb5r81y0XByMs+KwmJy5mSU0wknMpTbU Q==;
X-CSE-ConnectionGUID: wmD2GDxFRfiRwjsvuWvTbQ==
X-CSE-MsgGUID: U6RT+qnNR0+E2LNoIadxRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4783705"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4783705"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 09:59:58 -0800
X-CSE-ConnectionGUID: dkPgXbQBSzqBWm/QZ045LQ==
X-CSE-MsgGUID: 6IOkMusfQ622G/UWgK1y+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="12734289"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 09:59:57 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 0/3] drm/i915/gvt: change display register includes
Date: Fri, 27 Nov 2026 19:59:50 +0200
Message-ID: <cover.1795802238.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Prepare for using different _MMIO definitions for i915 and display.

Jani Nikula (3):
  drm/i915/gvt: rename display_helpers.h to display_registers.h
  drm/i915/gvt: group all display includes in one header
  drm/i915/gvt: reduce some display includes

 drivers/gpu/drm/i915/gvt/cmd_parser.c        |  6 +-
 drivers/gpu/drm/i915/gvt/display.c           | 11 +--
 drivers/gpu/drm/i915/gvt/display_helpers.h   | 37 ----------
 drivers/gpu/drm/i915/gvt/display_registers.h | 73 ++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/dmabuf.c            |  4 +-
 drivers/gpu/drm/i915/gvt/edid.c              |  3 +-
 drivers/gpu/drm/i915/gvt/fb_decoder.c        |  8 +--
 drivers/gpu/drm/i915/gvt/handlers.c          | 28 ++------
 drivers/gpu/drm/i915/gvt/interrupt.c         |  3 +-
 drivers/gpu/drm/i915/gvt/mmio.c              |  3 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c  | 26 +------
 11 files changed, 85 insertions(+), 117 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/gvt/display_helpers.h
 create mode 100644 drivers/gpu/drm/i915/gvt/display_registers.h


base-commit: c365fe77cc4964431963813514be95adc0cfb56f
-- 
2.47.3

