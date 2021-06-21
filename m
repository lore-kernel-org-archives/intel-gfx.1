Return-Path: <SRS0=oyEe=LP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E0ADC4743C
	for <intel-gfx@archiver.kernel.org>; Mon, 21 Jun 2021 10:26:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7CA861059
	for <intel-gfx@archiver.kernel.org>; Mon, 21 Jun 2021 10:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7CA861059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6540D89E11;
	Mon, 21 Jun 2021 10:26:41 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0C489E0E;
 Mon, 21 Jun 2021 10:26:39 +0000 (UTC)
IronPort-SDR: KTEwgOgNSZuGni6ni1gyGRgS5KhN4GKNGA0rwadScOZk5mx3ttxW9vV4p5tdpTg0LnkrmY+SAw
 MhWxFOYQkheA==
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="206637061"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="206637061"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 03:26:39 -0700
IronPort-SDR: UwWvUuU2SJj/EJBjYr2XopXjxSjRUV8vishL26GW3nlDG8PYTkhefLjvWlOuEwIEYKtWRj0ZT4
 JxgD75hcLPZQ==
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="623034761"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 03:26:37 -0700
Received: from platvala by thrakatuluk with local (Exim 4.94)
 (envelope-from <petri.latvala@intel.com>)
 id 1lvHAT-0004P3-OE; Mon, 21 Jun 2021 13:28:37 +0300
Date: Mon, 21 Jun 2021 13:28:37 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Vidya Srinivas <vidya.srinivas@intel.com>
Message-ID: <YNBp1bQ3YucQAnIs@platvala-desk.ger.corp.intel.com>
References: <1622176367-12608-1-git-send-email-vidya.srinivas@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1622176367-12608-1-git-send-email-vidya.srinivas@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH i-g-t] [RFC] tests/drm_read: Fix subtest
 invalid-buffer
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
Cc: igt-dev@lists.freedesktop.org, markyacoub@chromium.org,
 intel-gfx@lists.freedesktop.org, charlton.lin@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, May 28, 2021 at 10:02:47AM +0530, Vidya Srinivas wrote:
> Using (void *)-1 directly in read is aborting on chrome systems.
> Following message is seen.
> 
> Starting subtest: invalid-buffer
> *** buffer overflow detected ***: terminated
> Received signal SIGABRT.
> Stack trace:
> Aborted (core dumped)
> 
> Patch just adds a pointer variable and uses it in read.
> 
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  tests/drm_read.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/drm_read.c b/tests/drm_read.c
> index ccf9d822fd8d..2fdec5be4078 100644
> --- a/tests/drm_read.c
> +++ b/tests/drm_read.c
> @@ -103,10 +103,11 @@ static void teardown(int fd)
>  static void test_invalid_buffer(int in)
>  {
>  	int fd = setup(in, 0);
> +	void *add = (void *)-1;
>  
>  	alarm(1);
>  
> -	igt_assert_eq(read(fd, (void *)-1, 4096), -1);
> +	igt_assert_eq(read(fd, add, 4096), -1);
>  	igt_assert_eq(errno, EFAULT);
>  
>  	teardown(fd);

This looked weird but then I checked what glibc is actually
doing. This is FORTIFY_SOURCE in action, and read() checks the buffer
with __builtin_object_size() that it has room for the read. Which it
can only do here if the address is a literal.

Reviewed-by: Petri Latvala <petri.latvala@intel.com>
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
