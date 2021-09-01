Return-Path: <SRS0=4rgl=NX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0572C4320A
	for <intel-gfx@archiver.kernel.org>; Wed,  1 Sep 2021 11:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F32C61053
	for <intel-gfx@archiver.kernel.org>; Wed,  1 Sep 2021 11:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F32C61053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B26897FB;
	Wed,  1 Sep 2021 11:20:12 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8769D897FB
 for <intel-gfx@lists.freedesktop.org>; Wed,  1 Sep 2021 11:20:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10093"; a="279726534"
X-IronPort-AV: E=Sophos;i="5.84,369,1620716400"; d="scan'208";a="279726534"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 04:20:10 -0700
X-IronPort-AV: E=Sophos;i="5.84,369,1620716400"; d="scan'208";a="532111476"
Received: from josearun-mobl1.gar.corp.intel.com (HELO localhost)
 ([10.251.212.211])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 04:20:08 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Animesh Manna <animesh.manna@intel.com>, intel-gfx@lists.freedesktop.org
Cc: Animesh Manna <animesh.manna@intel.com>
In-Reply-To: <20210812054806.22745-1-animesh.manna@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210812054806.22745-1-animesh.manna@intel.com>
Date: Wed, 01 Sep 2021 14:20:05 +0300
Message-ID: <87czpsbl0a.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-gfx] [PATCH 0/5] Fix in max source calculation for dp/edp
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

On Thu, 12 Aug 2021, Animesh Manna <animesh.manna@intel.com> wrote:
> HBR3 support for display gen11+ platform is depends upon some
> conditions which are mentioned below.

The series no longer applies, please rebase and resend.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
