Return-Path: <SRS0=qPlD=GT=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3838CC433DB
	for <intel-gfx@archiver.kernel.org>; Sat, 16 Jan 2021 09:21:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD0F623A56
	for <intel-gfx@archiver.kernel.org>; Sat, 16 Jan 2021 09:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD0F623A56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6754B6E073;
	Sat, 16 Jan 2021 09:21:17 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5B16E073
 for <intel-gfx@lists.freedesktop.org>; Sat, 16 Jan 2021 09:21:16 +0000 (UTC)
IronPort-SDR: 1Zdjd3xBDiThzbIP90RXgyzhJd+4pCUJIFBL7pl8beXILDVm1bRWwMxSHbDoWbInFs2L3bOXnF
 yBK3QFX3JNOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9865"; a="178803882"
X-IronPort-AV: E=Sophos;i="5.79,351,1602572400"; d="scan'208";a="178803882"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2021 01:21:14 -0800
IronPort-SDR: 82qgEMQRPlHvXKT1aJ8x8Uldg+CvgCzJnV5+TlwC7AcwCx/xtC19JXZF4ifalP+Cee1Qn5/zzi
 XDtyuO0ec2bw==
X-IronPort-AV: E=Sophos;i="5.79,351,1602572400"; d="scan'208";a="382949107"
Received: from atrikali-mobl.amr.corp.intel.com (HELO localhost)
 ([10.213.192.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2021 01:21:12 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Swarup\, Aditya" <aditya.swarup@intel.com>, "Roper\,
 Matthew D" <matthew.d.roper@intel.com>, "De Marchi\,
 Lucas" <lucas.demarchi@intel.com>,
 "intel-gfx\@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Sat, 16 Jan 2021 11:21:09 +0200
Message-ID: <87o8hpnsoq.fsf@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] topic branch for adl-s: topic/adl-s-enabling
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


I just created a topic branch for adl-s enabling called
topic/adl-s-enabling, based on

git merge-base drm-intel/drm-intel-next drm-intel/drm-intel-gt-next

i.e.

fb5cfcaa2efb ("Merge tag 'drm-intel-gt-next-2021-01-14' of git://anongit.freedesktop.org/drm/drm-intel into drm-next")

The idea is that the adl-s enabling patches get reviewed and applied
here, and when they're all there, it gets merged to both drm-intel-next
and drm-intel-gt-next without delay.

Due to some pressure from Dave Airlie I've had to proceed to apply some
intel_display.c refactoring patches. Let's hope they don't cause too
much trouble.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
