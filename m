Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029EAC7EE2A
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Jun 2025 17:03:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6991D10E2AC;
	Fri, 27 Jun 2025 17:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="lLKFhWE7";
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617C110E29F;
 Fri, 27 Jun 2025 17:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=BX8yP699mQd1hqQWYrl2/cTWYSKTaQhOnRx2XR4O0nI=; b=lLKFhWE7lu96o6X4WT3tH4Sf1O
 oFn+aopDUWdGLcdZZzN4QfYf4S6XDwKRYHArQn5ap3m58Et87mT4Ayt6ydcfEgKSJk9PEFzYHQGW/
 JMPMcvwErhnhXiakaH6uPHmYcq+T3F3YwECBJHYqoUiNPo9ymCBd1Ib/d9+WGAmCO0GI/fl3FtOmv
 +toLcyd8ZL6SW5pWju0H9RRNwMPb2ngciRiSRQuHslvf32Vy10QFJC1mkVGwPE+K86H2nT+LgoeKL
 1nQzjkHMiGrUvnzfn32qPmJoVD+pIIBdxrgVJB1unlnK8fQDHJ9XR/SU0LsqA909wugZbwr1k3AbM
 5BCG5tNw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uVCTl-0000000EZN4-26cY;
 Fri, 27 Jun 2025 17:03:09 +0000
Date: Fri, 27 Jun 2025 18:03:09 +0100
From: Matthew Wilcox <willy@infradead.org>
To: =?utf-8?B?6ZmI5rab5rab?= Taotao Chen <chentaotao@didiglobal.com>
Cc: "tytso@mit.edu" <tytso@mit.edu>, "hch@infradead.org" <hch@infradead.org>,
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "brauner@kernel.org" <brauner@kernel.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "chentao325@qq.com" <chentao325@qq.com>,
 "frank.li@vivo.com" <frank.li@vivo.com>
Subject: Re: [PATCH v3 4/4] ext4: support uncached buffered I/O
Message-ID: <aF7OzbVwXqbJaLQA@casper.infradead.org>
References: <20250627110257.1870826-1-chentaotao@didiglobal.com>
 <20250627110257.1870826-5-chentaotao@didiglobal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250627110257.1870826-5-chentaotao@didiglobal.com>
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

On Fri, Jun 27, 2025 at 11:03:13AM +0000, 陈涛涛 Taotao Chen wrote:
> +++ b/fs/ext4/inode.c
> @@ -1270,6 +1270,9 @@ static int ext4_write_begin(const struct kiocb *iocb,
>  	if (unlikely(ret))
>  		return ret;
>  
> +	if (iocb->ki_flags & IOCB_DONTCACHE)
> +		fgp |= FGP_DONTCACHE;

I think this needs to be:

	if (iocb && iocb->ki_flags & IOCB_DONTCACHE)

because it's legit to call write_begin with a NULL argument.  The
'file' was always an optional argument, and we should preserve that
optionality with this transformation.

I wonder if it's worth abstracting some of this boilerplate.  Something
like:

struct folio *write_begin_get_folio(iocb, mapping, index, len)
{
	fgf_t fgflags = FGP_WRITEBEGIN;

	if (iocb && iocb->ki_flags & IOCB_DONTCACHE)
		fgflags |= FGP_DONTCACHE;
	fgflags |= fgf_set_order(len);

	return __filemap_get_folio(mapping, index, fgflags,
			mapping_gfp_mask(mapping));
}

