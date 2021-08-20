Return-Path: <SRS0=BHe2=NL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACDF9C4338F
	for <intel-gfx@archiver.kernel.org>; Fri, 20 Aug 2021 08:35:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EB4B61075
	for <intel-gfx@archiver.kernel.org>; Fri, 20 Aug 2021 08:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5EB4B61075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D857A6EA54;
	Fri, 20 Aug 2021 08:35:53 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB476EA39
 for <intel-gfx@lists.freedesktop.org>; Fri, 20 Aug 2021 08:35:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10081"; a="196318727"
X-IronPort-AV: E=Sophos;i="5.84,336,1620716400"; d="scan'208";a="196318727"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 01:35:52 -0700
X-IronPort-AV: E=Sophos;i="5.84,336,1620716400"; d="scan'208";a="523182921"
Received: from jphilipp-mobl2.ger.corp.intel.com (HELO [10.252.58.211])
 ([10.252.58.211])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 01:35:51 -0700
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210819210349.95103-1-lucas.demarchi@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <23c01761-bfd3-ff98-b549-f0bf02953e15@linux.intel.com>
Date: Fri, 20 Aug 2021 10:35:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210819210349.95103-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dg1: remove __maybe_unused leftover
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

Op 19-08-2021 om 23:03 schreef Lucas De Marchi:
> This was added in commit 05e265841f7e ("drm/i915/dg1: add initial DG-1
> definitions") so we could continue to add support for DG1 without
> risk to expose a broken UAPI. Now that we added DG1 to the PCI ID list
> i915 may bind to, remove the leftover.
>
> Fixes: d5ef86b38e4c ("drm/i915: Add pci ids and uapi for DG1")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 93ccdc6bbd03..96cfd6427cec 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -894,7 +894,7 @@ static const struct intel_device_info rkl_info = {
>  	.has_snoop = 1, \
>  	.is_dgfx = 1
>  
> -static const struct intel_device_info dg1_info __maybe_unused = {
> +static const struct intel_device_info dg1_info = {
>  	GEN12_FEATURES,
>  	DGFX_FEATURES,
>  	.graphics_rel = 10,

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

