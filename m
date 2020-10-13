Return-Path: <SRS0=Vt61=DU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A8CC433E7
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Oct 2020 12:22:03 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 990DF2237B
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Oct 2020 12:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 990DF2237B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chris-wilson.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2456E334;
	Tue, 13 Oct 2020 12:22:02 +0000 (UTC)
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A026E30D;
 Tue, 13 Oct 2020 12:21:59 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22701999-1500050 for multiple; Tue, 13 Oct 2020 13:21:56 +0100
MIME-Version: 1.0
In-Reply-To: <20201013121139.104017-1-matthew.auld@intel.com>
References: <20201013121139.104017-1-matthew.auld@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
Date: Tue, 13 Oct 2020 13:21:55 +0100
Message-ID: <160259171539.2946.6786234434902437425@build.alporthouse.com>
User-Agent: alot/0.9
Subject: Re: [Intel-gfx] [igt-dev] [PATCH] tests/gem_exec_params: test
 overly large batch
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

Quoting Matthew Auld (2020-10-13 13:11:39)
> See if can make something explode with too large batch (1ULL << 32),
> while also making the batch_len implicit. We should also try each engine
> since batch_len seems to have different interactions related to that.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>  tests/i915/gem_exec_params.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
> index f8a94074..e00bbd04 100644
> --- a/tests/i915/gem_exec_params.c
> +++ b/tests/i915/gem_exec_params.c
> @@ -273,7 +273,7 @@ static void mmapped(int i915)
>         gem_close(i915, buf);
>  }
>  
> -static uint32_t batch_create_size(int fd, uint32_t size)
> +static uint32_t batch_create_size(int fd, uint64_t size)
>  {
>         const uint32_t bbe = MI_BATCH_BUFFER_END;
>         uint32_t handle;
> @@ -317,6 +317,32 @@ static void test_invalid_batch_start(int fd)
>         gem_close(fd, exec.handle);
>  }
>  
> +static void test_larger_than_life_batch(int fd)
> +{
> +       uint64_t size = 1ULL << 32; /* batch_len is __u32 as per the ABI */
> +       struct drm_i915_gem_exec_object2 exec = {
> +               .handle = batch_create_size(fd, size),
> +       };
> +       struct drm_i915_gem_execbuffer2 execbuf = {
> +               .buffers_ptr = to_user_pointer(&exec),
> +               .buffer_count = 1,
> +       };


Needs intel_require_memory(2, size, CHECK_RAM)

> +
> +       /*
> +       * batch_len seems like it can have different interaction depending on
> +       * the engine and HW.
> +       */
> +       for_each_engine(e, fd) {
> +              execbuf.flags = eb_ring(e);
> +              /* Make the batch_len implicit */
> +              __gem_execbuf(fd, &execbuf);

Expect success.

> +
> +              gem_sync(fd, exec.handle);

?

If you just want to be sure the system is idle, put it after the loop.
Otherwise it doesn't/shouldn't affect the interpretation of the params
(if paranoid, do both, though to ensure it is active at the time, you
would need a spinner).
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
