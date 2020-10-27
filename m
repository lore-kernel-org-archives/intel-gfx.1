Return-Path: <SRS0=9UyP=EC=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9DFC388F9
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Oct 2020 11:04:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CC4A21655
	for <intel-gfx@archiver.kernel.org>; Tue, 27 Oct 2020 11:04:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=shipmail.org header.i=@shipmail.org header.b="BNPNFskS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CC4A21655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shipmail.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D546E0BF;
	Tue, 27 Oct 2020 11:04:02 +0000 (UTC)
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B333F6E0BF
 for <intel-gfx@lists.freedesktop.org>; Tue, 27 Oct 2020 11:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id CAF653F5F1;
 Tue, 27 Oct 2020 12:03:59 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=BNPNFskS; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JvsldQUZ_QdG; Tue, 27 Oct 2020 12:03:54 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 7CDC43F6AD;
 Tue, 27 Oct 2020 12:03:52 +0100 (CET)
Received: from Win10-768gb107.SSPE.ch.intel.com (jfdmzpr04-ext.jf.intel.com
 [134.134.137.73])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 8C6AF3600BE;
 Tue, 27 Oct 2020 12:03:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1603796632; bh=41ISk36t1CZ4W4xInIInbW3stJ65DnYNYnZeiizfpCY=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=BNPNFskSVv+fVKqS1jdsXITC0WvO+e5CXUA9q7/eAetigMJU5US5zt9X9KqXp3CJM
 bQbMT14EIOanyvwAakio1ilfRwjPWxAQJKKMFq/wEQE3x+XYDGF+yBuqZv4Al9SyvF
 9v5Nr6yR4QHOLHZ6sutE6GT2XVg27QPDWx2NXGUI=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20201015112627.1142745-1-maarten.lankhorst@linux.intel.com>
 <20201015112627.1142745-5-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <8677ec74-b31e-05c9-2cdf-514fd11462e4@shipmail.org>
Date: Tue, 27 Oct 2020 12:03:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201015112627.1142745-5-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH v3 04/63] drm/i915: Pin timeline map after
 first timeline pin, v3.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


On 10/15/20 1:25 PM, Maarten Lankhorst wrote:
> We're starting to require the reservation lock for pinning,
> so wait until we have that.
>
> Update the selftests to handle this correctly, and ensure pin is
> called in live_hwsp_rollover_user() and mock_hwsp_freelist().
>
> Changes since v1:
> - Fix NULL + XX arithmatic, use casts. (kbuild)
> Changes since v2:
> - Clear entire cacheline when pinning.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Reported-by: kernel test robot <lkp@intel.com>
...
> @@ -150,6 +161,12 @@ int intel_timeline_pin(struct intel_timeline *tl, struct i915_gem_ww_ctx *ww)
>   	if (atomic_add_unless(&tl->pin_count, 1, 0))
>   		return 0;
>   
> +	if (!tl->hwsp_map) {
> +		err = intel_timeline_pin_map(tl);
> +		if (err)
> +			return err;
> +	}
> +

On subsequent errors or if somebody beats us to the 0->1 transition, we 
need to unpin_map to avoid leaking pins.

>   	err = i915_ggtt_pin(tl->hwsp_ggtt, ww, 0, PIN_HIGH);
>   	if (err)
>   		return err;

> diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.h b/drivers/gpu/drm/i915/gt/intel_timeline.h
> index 9882cd911d8e..1cfdc4679b62 100644
> --- a/drivers/gpu/drm/i915/gt/intel_timeline.h
> +++ b/drivers/gpu/drm/i915/gt/intel_timeline.h
> @@ -106,4 +106,6 @@ int intel_timeline_read_hwsp(struct i915_request *from,
>   void intel_gt_init_timelines(struct intel_gt *gt);
>   void intel_gt_fini_timelines(struct intel_gt *gt);
>   
> +I915_SELFTEST_DECLARE(int intel_timeline_pin_map(struct intel_timeline *tl));
> +
>   #endif
> diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
> index 2f830017c51d..effbac877eec 100644
> --- a/drivers/gpu/drm/i915/gt/mock_engine.c
> +++ b/drivers/gpu/drm/i915/gt/mock_engine.c
> @@ -32,9 +32,20 @@
>   #include "mock_engine.h"
>   #include "selftests/mock_request.h"
>   
> -static void mock_timeline_pin(struct intel_timeline *tl)
> +static int mock_timeline_pin(struct intel_timeline *tl)
>   {
> +	int err;
> +
> +	if (WARN_ON(!i915_gem_object_trylock(tl->hwsp_ggtt->obj)))
> +		return -EBUSY;

I think we should either annotate this properly as an isolated lock, or 
allow a silent -EBUSY.

/Thomas


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
