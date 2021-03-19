Return-Path: <SRS0=r5PR=IR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86AE5C433DB
	for <intel-gfx@archiver.kernel.org>; Fri, 19 Mar 2021 17:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 460AC61925
	for <intel-gfx@archiver.kernel.org>; Fri, 19 Mar 2021 17:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 460AC61925
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42866EA5F;
	Fri, 19 Mar 2021 17:36:38 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B876E0C4
 for <intel-gfx@lists.freedesktop.org>; Fri, 19 Mar 2021 17:36:34 +0000 (UTC)
IronPort-SDR: iL9rMU0LpPSvZthnj6xG9BxGljk6CfwMO2hfHykUVhmgWuCX+/7B3iPn1XhtgLx2VzCevf56KV
 HQgnTjkH/3Bw==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="177522282"
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; d="scan'208";a="177522282"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 10:36:33 -0700
IronPort-SDR: tAe9nMMZdLQAHHgB+eiQLDybI3ntwHTC/0TtGLdfIQFcrgu7vDrrsZkap0MscJDzso/BpVbSiB
 xnQpLHpRXypw==
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; d="scan'208";a="450943580"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 10:36:33 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Fri, 19 Mar 2021 10:36:00 -0700
Message-Id: <20210319173603.521779-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v2 0/3] Simplify intel_setup_outputs()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

First and second patches should be straightforward. Third patch is a
tentative simplification that may break things in the presence of broken
VBTs, but I'm feeling confident. Also, GLK should cover the case for
display version 10.

Lucas De Marchi (3):
  drm/i915/display: move vbt check to intel_ddi_init()
  drm/i915/display: remove FIXME comment for intended feature
  drm/i915/display: remove strap checks from gen 9

 drivers/gpu/drm/i915/display/intel_display.c | 54 ++++++--------------
 1 file changed, 16 insertions(+), 38 deletions(-)

-- 
2.30.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
