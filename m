Return-Path: <SRS0=NHSF=FL=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C927FC433FE
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Dec 2020 16:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 780E823750
	for <intel-gfx@archiver.kernel.org>; Mon,  7 Dec 2020 16:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 780E823750
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB31F89932;
	Mon,  7 Dec 2020 16:19:48 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BAC89932
 for <intel-gfx@lists.freedesktop.org>; Mon,  7 Dec 2020 16:19:46 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607357985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C/sQljTyhwUHTax9M8bioo3pwWQ7vbfn0SifDxcVhSU=;
 b=daPJYYstwXwkwp7Us5EjfmoRdt/dKmWwd1ay66mz3AYkonITnKgsDvtsMQTXOZyQ84kDo2
 WokUttcO1OEThJXxPfmwEAduSnbEHcwAWCa7lvCZfW/umpij7Xr0mhn5x4LnIGYFWnaMfO
 SNQwLy0EZFRt+vK6udNE784KCz+lbgkGq8JlXhCd80RDYtjt1fwi+OHvq7a1eYPcewWElK
 3llyPa6hpUsQpM6POeFUkXeLIp9+7M48VDuO78bxd2TlW4PGsV/QMqsS/6ZX8Sa9Jfa9T4
 Steq0NCMw+NVM8oh2I5UmGUFM5HpXTCvJLDSL8pGZHeAhb+oqUlhInhB33poNw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607357985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C/sQljTyhwUHTax9M8bioo3pwWQ7vbfn0SifDxcVhSU=;
 b=6T3c4F0TLNkZ/0M/LqgMkgAIlzNgeXLtZd/k8BXHbBREzVmKufMvVAGQuEVBqTjWqG/R4e
 k9VJJ4G6u22o+hBw==
To: Ira Weiny <ira.weiny@intel.com>
In-Reply-To: <20201207064655.GK1563847@iweiny-DESK2.sc.intel.com>
References: <20201124060755.1405602-1-ira.weiny@intel.com>
 <20201124060755.1405602-4-ira.weiny@intel.com>
 <160648211578.10416.3269409785516897908@jlahtine-mobl.ger.corp.intel.com>
 <20201204160504.GH1563847@iweiny-DESK2.sc.intel.com>
 <878sad9p7f.fsf@nanos.tec.linutronix.de>
 <20201207064655.GK1563847@iweiny-DESK2.sc.intel.com>
Date: Mon, 07 Dec 2020 17:19:44 +0100
Message-ID: <87ft4h6127.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 03/17] drivers/gpu: Convert to mem*_page()
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
Cc: Alexei Starovoitov <ast@kernel.org>, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Matthew Wilcox <willy@infradead.org>, Eric Biggers <ebiggers@kernel.org>,
 Chao Yu <yuchao0@huawei.com>, intel-gfx@lists.freedesktop.org,
 Josef Bacik <josef@toxicpanda.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Brian King <brking@us.ibm.com>, Al Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Nicolas Pitre <nico@fluxnic.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>, Luis Chamberlain <mcgrof@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Sun, Dec 06 2020 at 22:46, Ira Weiny wrote:
> On Fri, Dec 04, 2020 at 11:33:08PM +0100, Thomas Gleixner wrote:
>> On Fri, Dec 04 2020 at 08:05, Ira Weiny wrote:
>> > So I think I'm going to submit the base patch to Andrew today (with some
>> > cleanups per the comments in this thread).
>> 
>> Could you please base that on tip core/mm where the kmap_local() muck is
>> and use kmap_local() right away?
>
> Sure.  Would that mean it should go through you and not Andrew?

If Andrew has no objections of course.

Thanks,

        tglx
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
