Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744BFC433F5
	for <intel-gfx@archiver.kernel.org>; Mon,  6 Dec 2021 14:49:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264A66FCCB;
	Mon,  6 Dec 2021 14:49:25 +0000 (UTC)
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A3B6FC60
 for <intel-gfx@lists.freedesktop.org>; Mon,  6 Dec 2021 14:49:23 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id x32so31845509ybi.12
 for <intel-gfx@lists.freedesktop.org>; Mon, 06 Dec 2021 06:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zDxkDL2OOqNPzqfqrMq15H6lv1cXQjh2+X+cYv9aUEs=;
 b=KrEKnxWGYBHWXaVfaEpB8cdbR7IQR/yw8j4Ok2dsE8zvV3OHADAr7CgcWehfXxW6Ka
 Z5rjRtmmn57xi/6VA1NFpxxaF33hKZSK+wIfmFJsEpG5mXkjJC8HJkw4YQiHVmHgi2Pd
 ggFDW5R8bYHBOzpXK2/pENeRyZ45ynzYp9OKdZwvrtSgWPVJIsOKsUVYlY/Hi3b6klKv
 5kWtV5+1llMQwjeLRZpLDUW4YZOiNjlmQnl011RDlyO4R0TRKNkA9NQvVgFdS1S3S5jz
 ObXtGnQSa24L+jbvVg3kQFG9Rna0SZ23PwGjx6JNd0vq43DYUzmk5oDQitOKoIl9Khb6
 ztFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zDxkDL2OOqNPzqfqrMq15H6lv1cXQjh2+X+cYv9aUEs=;
 b=dZFCDA9OSl+2QrgQnh9XIDR50aWf34dNZVjd7yyQCarAZG1Sq63p9+Vv/4ZXMFmHrJ
 Gk1vVrUA8gMio9skR/7BNB9Jg/hkQXX+ZvM/kdYOjQkjlX0HTFJ+9dU7elbfDN/6kWzn
 YbwPFFE/g+/uzVJglMAtJDvML9eG7pqW9yRQ5IZkoQXZttuBqWpAxcron4u5P//e0x+l
 yiA2zChLKhiEs2S0bJKMJfRyGWZJ9iWmR6uhUZxPRNnu25rGGttblSNDp2ici5MmmrS0
 apLFg+Q1sDLJGdYbMikBAj9/WKkS9NLI4TXiZ/ydp54O5g6LXL2ND2IiOb8sgohI1QrI
 nEzg==
X-Gm-Message-State: AOAM533r0IbLaJMroj+VHg6HKWH0HWtjoPuAxxTWijGiKgtkbqzcF6BQ
 9Q8rhBr/cFaE2GZ7FCrhq2rZZGwsnCzKUKSnuvK5LA==
X-Google-Smtp-Source: ABdhPJzywfO33VUvzdEQ6eiiMqE7/3fLMVJK5noAum/X0wBZ4L7GKJVVjs/cY3Sl2y6vV/Q+AHhA1VDEbHdprZE93Ao=
X-Received: by 2002:a25:6ed6:: with SMTP id
 j205mr44077096ybc.707.1638802162383; 
 Mon, 06 Dec 2021 06:49:22 -0800 (PST)
MIME-Version: 1.0
References: <20211206133140.3166205-1-matthew.auld@intel.com>
In-Reply-To: <20211206133140.3166205-1-matthew.auld@intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 6 Dec 2021 14:49:11 +0000
Message-ID: <CAPj87rOuZpEcHoO-4nJ-ndvfR32FE82iFfJFV2kUZ=u-PtPvwg@mail.gmail.com>
To: Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-gfx] [PATCH v3 0/8] DG2 accelerated migration/clearing
 support
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Matthew,

On Mon, 6 Dec 2021 at 13:32, Matthew Auld <matthew.auld@intel.com> wrote:
> Enable accelerated moves and clearing on DG2. On such HW we have minimum page
> size restrictions when accessing LMEM from the GTT, where we now have to use 64K
> GTT pages or larger. With the ppGTT the page-table also has a slightly different
> layout from past generations when using the 64K GTT mode(which is still enabled
> on via some PDE bit), where it is now compacted down to 32 qword entries. Note
> that on discrete the paging structures must also be placed in LMEM, and we need
> to able to modify them via the GTT itself(see patch 7), which is one of the
> complications here.
>
> The series needs to be applied on top of the DG2 enabling branch:
> https://cgit.freedesktop.org/~ramaling/linux/log/?h=dg2_enabling_ww49.3

What are the changes to the v1/v2?

Cheers,
Daniel
