Return-Path: <SRS0=wI8T=LB=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53ACC47082
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Jun 2021 15:26:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6CDC61159
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Jun 2021 15:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6CDC61159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59AC089FF7;
	Mon,  7 Jun 2021 15:26:27 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D1389FF7
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Jun 2021 15:26:26 +0000 (UTC)
IronPort-SDR: PU8P4Ek7JmNUOoyoSnkVyzYxCdcK3sLQjqf0ZTLYFsQErZ0oq7NjtWKyxQjkq5GtoEB3JI+6tZ
 7xGsUmXUrljg==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="202782410"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="202782410"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 08:26:25 -0700
IronPort-SDR: o3l649WpUmxuR4Co1gyG8JTjPM0Oyp3zofEWVguFhigdmDOviS3UIcXPIB0e7yIJW68URp8K9u
 joq+drxq3RrQ==
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="481563867"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 08:26:22 -0700
Date: Mon, 7 Jun 2021 18:21:17 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Anshuman Gupta <anshuman.gupta@intel.com>
In-Reply-To: <20210601100228.6064-2-anshuman.gupta@intel.com>
Message-ID: <alpine.DEB.2.22.394.2106071809090.3922722@eliteleevi.tm.intel.com>
References: <20210601100228.6064-1-anshuman.gupta@intel.com>
 <20210601100228.6064-2-anshuman.gupta@intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [RFC v3 1/2] drm/i915/dg1: Adjust the AUDIO power
 domain
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi,

On Tue, 1 Jun 2021, Anshuman Gupta wrote:

> DG1 and XE_PLD platforms has Audio MMIO/VERBS lies in PG0 power
> well. Adjusting the power domain accordingly to
> POWER_DOMAIN_AUDIO_VERBS for audio detection and POWER_DOMAIN_AUDIO
> for audio playback.

thanks Anshuman! From audio perspective this looks good to go. 

It would seem we don't need any additional code in display/intel_audio.c. 
In theory, this leaves some corner cases, where we will take PD_AUDIO when 
only PD_AUDIO_VERBS would suffice, but these mostly relate to initial 
audio driver probe, so no need add separate logic for these.

Br, Kai

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
