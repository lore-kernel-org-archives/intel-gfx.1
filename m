Return-Path: <SRS0=Tqpp=JK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42ACC433B4
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Apr 2021 06:54:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9533F613AE
	for <intel-gfx@archiver.kernel.org>; Tue, 13 Apr 2021 06:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9533F613AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E37089D5B;
	Tue, 13 Apr 2021 06:54:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E39C89D5B
 for <intel-gfx@lists.freedesktop.org>; Tue, 13 Apr 2021 06:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=rl7Av8z9Mb3AhGc2I2b/HfzYNKQlfkZtLSkmthxZ3Cs=; b=oXena5QrQsAuq/lXovE/vdznzG
 Zbnw2r9xxmldDA6+M9jB/+SFl853WgrhtbLlh7a+sWTsFgAEDytibwY8ygQJwRnj44+OSwPpQlAhB
 wLRDFznR8fpfuV7KYpgr20R93SPHj7ah/oFpN2O8fWd8+1X/hZLFDqIeNR6S1wQ1+//pSsxqJHO2C
 /+gfU1cAMp8iuXFAPdisVwcT0QDxckiECBBoWtjD94zP99pTR2jiaQ/lYsHrb20tTQAjHatpWRBIv
 xBgjcCOkLTBJf8PSKJz8TiitpXrQuOEwgajMbT2zHmaZZfcRqAhkJXL+cqsZRJoZv3X9nSV+A9o1R
 eVq7xOXg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lWCwU-008RVy-9U; Tue, 13 Apr 2021 06:54:40 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E7E2C300036;
 Tue, 13 Apr 2021 08:54:33 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id D8DCC2C4B2093; Tue, 13 Apr 2021 08:54:33 +0200 (CEST)
Date: Tue, 13 Apr 2021 08:54:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kees Cook <keescook@chromium.org>
Message-ID: <YHVAKeYh04y5w7ia@hirez.programming.kicks-ass.net>
References: <20210412080012.357146277@infradead.org>
 <20210412080611.902470568@infradead.org>
 <202104121306.3A73BEB0A5@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202104121306.3A73BEB0A5@keescook>
Subject: Re: [Intel-gfx] [PATCH 6/7] i915: Convert to verify_page_range()
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
Cc: jgross@suse.com, sstabellini@kernel.org, intel-gfx@lists.freedesktop.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, chris@chris-wilson.co.uk,
 linux-mm@kvack.org, boris.ostrovsky@oracle.com, hch@lst.de,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, Apr 12, 2021 at 01:08:38PM -0700, Kees Cook wrote:
> On Mon, Apr 12, 2021 at 10:00:18AM +0200, Peter Zijlstra wrote:
> > @@ -1249,14 +1249,14 @@ static int check_absent_pte(pte_t *pte,
> >  
> >  static int check_present(unsigned long addr, unsigned long len)
> >  {
> > -	return apply_to_page_range(current->mm, addr, len,
> > -				   check_present_pte, (void *)addr);
> > +	return verify_page_range(current->mm, addr, len,
> > +				 check_present_pte, (void *)addr);
> 
> For example, switch to returning bad addr through verify_page_range(),
> or have a by-reference value, etc:
> 
> 	unsigned long failed;
> 
> 	failed = verify_page_range(current->mm< addr, len, check_present_pte);
> 	if (failed) {
>   		pr_err("missing PTE:%lx\n",
>   		       (addr - failed) >> PAGE_SHIFT);

OK, lemme try that.
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
