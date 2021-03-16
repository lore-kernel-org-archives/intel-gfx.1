Return-Path: <SRS0=yXj8=IO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE09C433E0
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Mar 2021 03:49:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9D7364FD9
	for <intel-gfx@archiver.kernel.org>; Tue, 16 Mar 2021 03:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9D7364FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A9689B84;
	Tue, 16 Mar 2021 03:49:13 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2FB89B84
 for <intel-gfx@lists.freedesktop.org>; Tue, 16 Mar 2021 03:49:12 +0000 (UTC)
IronPort-SDR: RcvpdW1cGG+fFZ+kbA1U5tUsP9C6x8wUHhtmG/yYxdU3w1P1v/L/trVNnn6TFmxQ5urBVMdAEC
 SbteUsBvt9pA==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="185834261"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="185834261"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2021 20:49:12 -0700
IronPort-SDR: Yy9WXKGdzu8dAuxcDdBI/3tlOpOXYJXNU2oNlqg5/TmR5CQK1xUs47UzPCnlnzqnJlICj2XXg2
 ARr23UU4YlOA==
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="405401918"
Received: from orsosgc001.ra.intel.com ([10.23.184.150])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2021 20:49:12 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Mon, 15 Mar 2021 20:49:06 -0700
Message-Id: <cover.1615865509.git.ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Subject: [Intel-gfx] [CI 0/1] drm/i915: Disable pread/pwrite ioctl's for IGT
 testing
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

FOR CI ONLY. PLEASE DON'T REVIEW.

The upstream guidance at this time is to start phasing out
pread/pwrite ioctl's, the rationale being (a) the functionality can be
done entirely in userspace with a combination of mmap + memcpy, and
(b) no existing user mode clients actually use the pread/pwrite
interface.

The plan is to phase out these ioctls for _new_ Gen12+ platforms. However,
since this patch is actually for CI and the real changes which need to be
validated are in IGT, in this patch we are disabling pread/pwrite for
existing Gen11 and Gen12 platforms. This will be changed once IGT changes
are validated and finalized.

Test-with: 20210315225356.2865-1-ashutosh.dixit@intel.com

Ashutosh Dixit (1):
  drm/i915: Disable pread/pwrite ioctl's for IGT testing

 drivers/gpu/drm/i915/i915_gem.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

-- 
2.29.2

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
