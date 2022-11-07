Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB88DC4332F
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Nov 2022 17:43:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA4A10E837;
	Mon,  7 Nov 2022 17:43:02 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBC410E828;
 Mon,  7 Nov 2022 17:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667842978; x=1699378978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GHPk9xqpYWmnySxynr7NduvhEBCfEm3hDibv2rvryPc=;
 b=ClpTIlCwtNBct2T1OAEDDkzk3f7LeY0LhvIdK9THiiDL+u/fexVupu+f
 y8xUmPVmzBLQ6Ew0BKzLeV37o/BURX0qwlKsHj+7FLhC4C+F61mWWz11S
 yLKgI/c45YpHP6spWwsShKj7ziS6gwESi79d9gryP5zztcwPuh/YZJuvy
 ZZECFNahp09vTg6e6Tp5gisijerFI8071V19cazr34lYGWz2bqsKkgfyR
 zBRsPYvxfse7RjvLSG4qjIh/TGe8Gg61APZ+NM3syOuGcdpi3yMX+vFMm
 yLC/zEl9RjSqFVtiFRJjxQ//z017+RZebiv6Yn7N80e4UGew6x33FqSr4 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="374744376"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="374744376"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 09:32:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="630568319"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="630568319"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 09:32:58 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Date: Mon,  7 Nov 2022 09:32:07 -0800
Message-Id: <20221107173209.2219571-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107173209.2219571-1-lucas.demarchi@intel.com>
References: <20221107173209.2219571-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH 1/3] Documentation/gpu: Fix section in the wrong
 scope
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
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

That section should still be inside "DRM client usage stats" rather than
as a sibling.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 Documentation/gpu/drm-usage-stats.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 92c5117368d7..b46327356e80 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -126,7 +126,6 @@ percentage utilization of the engine, whereas drm-engine-<str> only reflects
 time active without considering what frequency the engine is operating as a
 percentage of it's maximum frequency.
 
-===============================
 Driver specific implementations
 ===============================
 
-- 
2.38.1

