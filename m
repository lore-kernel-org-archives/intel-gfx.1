Return-Path: <SRS0=gLHY=F3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50D0C433E0
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Dec 2020 20:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6028221F5
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Dec 2020 20:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6028221F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486816E88A;
	Wed, 23 Dec 2020 20:46:55 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF066E88A
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Dec 2020 20:46:53 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23418124-1500050 for multiple; Wed, 23 Dec 2020 20:46:49 +0000
MIME-Version: 1.0
In-Reply-To: <20201223171941.308038-1-matthew.auld@intel.com>
References: <20201223171941.308038-1-matthew.auld@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Wed, 23 Dec 2020 20:46:49 +0000
Message-ID: <160875640941.15843.17454890865469237203@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [PATCH] drm/i915: clear the end of the shadow batch
 if needed
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

Quoting Matthew Auld (2020-12-23 17:19:41)
> The shadow batch is an internal object, which doesn't have any page
> clearing, and since the batch_len might be within a page, we should take
> care to clear any unused dwords before making it visible in the ppGTT.
> 
> Testcase: igt/gen9_exec_parse/shadow-peek
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_cmd_parser.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_cmd_parser.c b/drivers/gpu/drm/i915/i915_cmd_parser.c
> index 8d88402387bd..6506ed30b444 100644
> --- a/drivers/gpu/drm/i915/i915_cmd_parser.c
> +++ b/drivers/gpu/drm/i915/i915_cmd_parser.c
> @@ -1139,6 +1139,7 @@ static u32 *copy_batch(struct drm_i915_gem_object *dst_obj,
>                        struct drm_i915_gem_object *src_obj,
>                        unsigned long offset, unsigned long length)
>  {
> +       unsigned long orig_length = length;

Hmm. This is too short, since this is shorter than the vma->size we
retrieved from the pool. It does feel like we need to clear first.

Anyway well spotted, and this should be cc'ed stable when we push.
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
