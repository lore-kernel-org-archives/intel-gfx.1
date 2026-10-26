Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AA3606A31F
	for <intel-gfx@archiver.kernel.org>; Mon, 26 Oct 2026 11:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K9G5L4YL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D49510EE67;
	Mon, 26 Oct 2026 11:53:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0465110EE67
 for <intel-gfx@lists.freedesktop.org>; Mon, 26 Oct 2026 11:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793015626; x=1824551626;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g3VI255iHLFRzF9wcWE2C7oZLCWmBdmeGoYVlewD+tA=;
 b=K9G5L4YL3ew4HtbnIFsgWG5lq5FkOixIhncg//yGpPwpGMTFOXaZ7ihL
 E6AAOtDJoJeT3dOt3Icg5NrQBB9uPz2KMKVLpWwgwhgu5p1cd/Rx/I9eh
 lW0DDu9mPFFtcsDZ5TTOAKzIZokvnJ0zHErLMn/1fQuxmuSH2jB7YRfHL
 /Zm3eY0pEk5WdcLWwIfyCKJz+vt5gGqBCXGG04TLgFrJoTmY8cjvxKmYs
 uJepGrNXr36C+ovTKlx2Zpp/oK5ulruYs4Gi8HgMHMWo3np97HXlHXDdu
 9Z9IGD2BxMYQNnsgIAz+GgyprV4sTfnVrsko1U28l91Kj6EYV39b0VKk8 Q==;
X-CSE-ConnectionGUID: 8PUXMc69RWWHd+n4IXyG7Q==
X-CSE-MsgGUID: JXWMjbGeRdWd8/TbUn14Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1579603"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1579603"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 04:53:46 -0700
X-CSE-ConnectionGUID: uHYBT0Q6Q4KDmZVXfLiVMQ==
X-CSE-MsgGUID: nR/dr0KeSgqT2u49CXe0IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4232164"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 04:53:44 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH v3 0/3] drm/i915/scaler: allocation cleanup
Date: Mon, 26 Oct 2026 12:53:26 +0100
Message-ID: <20261026115329.2343954-1-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Basically a resend of [1] with Jani's review applied.

Not great as this wastes whole CI cycle on commit message edit, but I
don't have idea how to handle it other way and I guess same applies for
all resends anyways.

BR,
Michał 

[1] https://lore.kernel.org/intel-gfx/20260615190839.1219417-1-michal.grzelak@intel.com/

---
Changelog:
v2->v3
- strip Fixes: trailers for cleanups (Jani)

v1->v2
- drop obfuscation of CASF check (Ville, Nemesa)
- return proper error code (Jani)


Michał Grzelak (3):
  drm/i915/scaler: drop unused plane_state argument
  drm/i915/scaler: s/i/scaler_id/
  drm/i915/scaler: return -EINVAL instead of -1

 drivers/gpu/drm/i915/display/skl_scaler.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

-- 
2.45.2

