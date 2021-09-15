Return-Path: <SRS0=Y9sQ=OF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACDFCC433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 15 Sep 2021 13:03:19 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D7516113E
	for <intel-gfx@archiver.kernel.org>; Wed, 15 Sep 2021 13:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D7516113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB996E925;
	Wed, 15 Sep 2021 13:03:18 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953AF6E925;
 Wed, 15 Sep 2021 13:03:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="201813672"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="201813672"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 06:03:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="544916455"
Received: from vmastnak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.214.245])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 06:02:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
In-Reply-To: <d7487c6a-43c9-3940-4f42-b8fa31704e2e@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <d7487c6a-43c9-3940-4f42-b8fa31704e2e@infradead.org>
Date: Wed, 15 Sep 2021 16:02:46 +0300
Message-ID: <87fsu6xa89.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-gfx] Intel UHD resolutions
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

On Fri, 10 Sep 2021, Randy Dunlap <rdunlap@infradead.org> wrote:
> Hi,
>
> I would like to use QHD resolution (2560x1440) with my shiny new
> computer and display. That resolution works if I boot Windows 10
> (cough).
>
> What do I need to do to use that resolution in Linux?
>
> I first tried openSUSE 15.3 (kernel 5.3.18-59.19-default)
> then I build a v5.14 kernel and tried that.
> Both of them max out at FHD (1920x1080).
>
> I am booting with "i915.force_probe=4c8a" on the kernel command line.

I'm guessing you're hitting some dual mode adapter limit.

Please file a bug over at [1], add drm.debug=14 module parameter, and
attach dmesg from boot to hitting the issue.

BR,
Jani.

[1] https://gitlab.freedesktop.org/drm/intel/issues/new



-- 
Jani Nikula, Intel Open Source Graphics Center
